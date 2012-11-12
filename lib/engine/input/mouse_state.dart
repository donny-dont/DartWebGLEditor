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

class MouseState implements IClonable
{
  /// The horizontal position of the mouse cursor.
  int _xPosition;
  /// The vertical position of the mouse cursor.
  int _yPosition;
  ///  The cumulative mouse scroll wheel value since the game was started.
  int _scrollWheelValue;
  /// The state of the mouse buttons
  List<ButtonState> _buttons;
  
  /**
   * Creates an instance of the [MouseState] class.
   */
  MouseState()
    : _xPosition = 0
    , _yPosition = 0
    , _scrollWheelValue = 0
    , _buttons = [ ButtonState.Released, ButtonState.Released, ButtonState.Released ];

  //---------------------------------------------------------------------
  // Properties
  //---------------------------------------------------------------------
  
  /**
   * The horizontal position of the mouse cursor.
   */
  int get x => _xPosition;
  
  /**
   * The vertical position of the mouse cursor.
   */
  int get y => _yPosition;
  
  /**
   * The cumulative mouse scroll wheel value since the game was started.
   */
  int get scrollWheelValue => _scrollWheelValue;
  
  /**
   * The state of the left mouse button.
   */
  ButtonState get leftButton => _buttons[MouseButtons.Left.value];
  
  /**
   * The state of the middle mouse button.
   */
  ButtonState get middleButton => _buttons[MouseButtons.Middle.value];  
  
  /**
   * The state of the right mouse button.
   */
  ButtonState get rightButton => _buttons[MouseButtons.Right.value];
    
  //---------------------------------------------------------------------
  // IClonable methods
  //---------------------------------------------------------------------

  /**
   * Creates a new object that is a copy of the current instance.
   */
  MouseState clone()
  {
    MouseState copy = new MouseState();

    cloneTo(copy);
    
    return copy;
  }
  
  /**
   * Copies the value of the instance into [cloneTo].
   */
  void cloneTo(MouseState copy)
  {
    copy._xPosition = _xPosition;
    copy._yPosition = _yPosition;
    
    int length = copy._buttons.length;
    
    for (int x = 0; x < length; ++x)
      copy._buttons[x] = _buttons[x];    
  }
  
  //---------------------------------------------------------------------
  // Private methods
  //---------------------------------------------------------------------

  /**
   * Sets the position of the mouse cursor.
   */
  void _setMousePosition(int x, int y)
  {
    _xPosition = x;
    _yPosition = y;
  }
  
  /**
   * Sets the [value] of the [MouseButton] at the given [index].
   */
  void _setMouseButtonState(int index, ButtonState value)
  {
    _buttons[index] = value;
  }
  
  /**
   * Adds [value] to the cumulative mouse scroll wheel's count. 
   */
  void _addToScrollWheelValue(int value)
  {
    _scrollWheelValue += value;
  }
}
