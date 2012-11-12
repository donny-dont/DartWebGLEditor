part of editor;

/**
 * Lithium-Ion Game Engine
 *
 * ---------------------------------------------------------------------
 *
 * Copyright (c) 2012, Don Olmstead
 * 
 * This software is provided 'as-is', without any express or implied
 * warranty. In no event will the authors be held liable for any damages
 * arising from the use of this software.
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 *   1. The origin of this software must not be misrepresented; you must not
 *   claim that you wrote the original software. If you use this software
 *   in a product, an acknowledgment in the product documentation would be
 *   appreciated but is not required.
 *
 *   2. Altered source versions must be plainly marked as such, and must not be
 *   misrepresented as being the original software.
 *
 *   3. This notice may not be removed or altered from any source
 *   distribution.
 */

/**
 * Represents information about the state of an Xbox 360 Controller.
 */
class GamePadState implements IClonable
{
  //---------------------------------------------------------------------
  // Button flags
  //
  // Correspond to the array given by the Gamepad API. The left/right
  // bottom buttons correspond to the left/right trigger.
  //---------------------------------------------------------------------
  
  /// Flag for the A button.
  static final int _aButtonFlag = 1 << 0;
  /// Flag for the B button.
  static final int _bButtonFlag = 1 << 1;
  /// Flag for the X button.
  static final int _xButtonFlag = 1 << 2;
  /// Flag for the Y button.
  static final int _yButtonFlag = 1 << 3;
  /// Flag for the left shoulder button.
  static final int _leftShoulderButtonFlag = 1 << 4;
  /// Flag for the right shoulder button.
  static final int _rightShoulderButtonFlag = 1 << 5;
  /// Flag for the back button.
  static final int _backButtonFlag = 1 << 8;
  /// Flag for the start button.
  static final int _startButtonFlag = 1 << 9;
  /// Flag for the left thumbstick button.
  static final int _leftThumbstickButtonFlag = 1 << 10;
  /// Flag for the right thumbstick button.
  static final int _rightThumbstickButtonFlag = 1 << 11;
  /// Flag for the D-pad up button.
  static final int _dPadUpButtonFlag = 1 << 12;
  /// Flag for the D-pad down button.
  static final int _dPadDownButtonFlag = 1 << 13;
  /// Flag for the D-pad left button.
  static final int _dPadLeftButtonFlag = 1 << 14;
  /// Flag for the D-pad right button.
  static final int _dPadRightButtonFlag = 1 << 15;
  
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------
  
  /// Whether the game pad is connected.
  bool _connected;
  /// The timestamp of the last change in the game pad's state.
  int _timestamp;
  /// The current state of the buttons.
  int _buttons;
  /// The value of the left trigger.
  double _leftTrigger;
  /// The value of the right trigger.
  double _rightTrigger;
  
  /**
   * Creates an instance of the [GamePadState] class.
   */
  GamePadState()
    : _connected = false
    , _timestamp = 0
    , _buttons = 0
    , _leftTrigger = 0.0
    , _rightTrigger = 0.0;
  
  //---------------------------------------------------------------------
  // Button Properties
  //---------------------------------------------------------------------

  /**
   * The state of the A button.
   */
  ButtonState get aButton => _isPressed(_aButtonFlag);
  
  /**
   * The state of the B button.
   */
  ButtonState get bButton => _isPressed(_bButtonFlag);
  
  /**
   * The state of the X button.
   */
  ButtonState get xButton => _isPressed(_xButtonFlag);
  
  /**
   * The state of the Y button.
   */
  ButtonState get yButton => _isPressed(_yButtonFlag);
  
  /**
   * The state of the left shoulder button.
   */
  ButtonState get leftShoulderButton => _isPressed(_leftShoulderButtonFlag);
  
  /**
   * The state of the right shoulder button.
   */
  ButtonState get rightShoulderButton => _isPressed(_rightShoulderButtonFlag);
  
  /**
   * The state of the back button.
   */
  ButtonState get backButton => _isPressed(_backButtonFlag);
  
  /**
   * The state of the start button.
   */
  ButtonState get startButton => _isPressed(_startButtonFlag);
  
  /**
   * The state of the left thumbstick button.
   */
  ButtonState get leftThumbstickButton => _isPressed(_leftThumbstickButtonFlag);
  
  /**
   * The state of the right thumbstick button.
   */
  ButtonState get rightThumbstickButton => _isPressed(_rightThumbstickButtonFlag);
  
  /**
   * The state of the D-pad up button.
   */
  ButtonState get dPadUp => _isPressed(_dPadUpButtonFlag);
  
  /**
   * The state of the D-pad down button.
   */
  ButtonState get dPadDown => _isPressed(_dPadDownButtonFlag);
  
  /**
   * The state of the D-pad left button.
   */
  ButtonState get dPadLeft => _isPressed(_dPadLeftButtonFlag);
  
  /**
   * The state of the D-pad right button.
   */
  ButtonState get dPadRight => _isPressed(_dPadRightButtonFlag);
  
  //---------------------------------------------------------------------
  // Properties
  //---------------------------------------------------------------------

  /**
   * Whether the game pad is connected.
   */
  bool get isConnected => _connected;
  

  /**
   * The value of the left trigger from [0,1].
   */
  double get leftTrigger => _leftTrigger;
  
  /**
   * The value of the right trigger from [0,1].
   */
  double get rightTrigger => _rightTrigger;
  
  //---------------------------------------------------------------------
  // IClonable methods
  //---------------------------------------------------------------------

  /**
   * Creates a new object that is a copy of the current instance.
   */
  GamePadState clone()
  {
    GamePadState copy = new GamePadState();
    
    cloneTo(copy);
    
    return copy;
  }
  
  /**
   * Copies the value of the instance into [clonetTo].
   */
  void cloneTo(GamePadState copy)
  {
    copy._connected = _connected;
    copy._buttons = _buttons;
  }
  
  //---------------------------------------------------------------------
  // Private methods
  //---------------------------------------------------------------------
  
  /**
   * Queries the state of the button.
   */
  ButtonState _isPressed(int flag)
  {
    return (_buttons & flag) == flag ? ButtonState.Pressed : ButtonState.Released;
  }
  
  /**
   * Updates the state of the game pad.
   * 
   * Converts the structure received from the Gamepad API
   * into the [GamePadState].
   */
  void _update(Gamepad gamepad)
  {
    if (_timestamp != gamepad.timestamp)
    {
      _connected = true;
      _timestamp = gamepad.timestamp;
      
      // Update the thumbsticks
      
      // Update the triggers
      // Assume that the left/right shoulder buttons are analog
      _leftTrigger = gamepad.buttons[6];
      _rightTrigger = gamepad.buttons[7];
      
      // Update the buttons
      _buttons = 0;
      
      for (int i = 0; i < 16; ++i)
      {
        _buttons |= (gamepad.buttons[i] != 0.0) ? 1 << i : 0;
      }
    }
  }
  
  /**
   * Disconnects the game pad.
   * 
   * Resets all the values.
   */
  void _disconnect()
  {
    _connected = false;
    _timestamp = 0;
    _buttons = 0;
    
    _leftTrigger = 0.0;
    _rightTrigger = 0.0;
  }
}
