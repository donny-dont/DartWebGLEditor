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

class Game
{
  static Game instance;
  
  /// The [GameWindow] associated with the [Game].
  GameWindow _gameWindow;
  /// The [GameView] being displayed.
  GameView _gameView;
  /// The [GraphicsDevice] associated with the [Game].
  Device _graphicsDevice;
  /// The handle associated with the viewport
  int _viewportHandle;
  /// The clear color
  vec4 _clearColor;

  Game()
    : _gameWindow = null
    , _gameView = new GameView()
    , _graphicsDevice = null
    , _viewportHandle = 0
    , _clearColor = new vec4(1.0, 1.0, 0.0, 1.0);
  
  void update(int time)
  {
    _graphicsDevice.immediateContext.clear(_clearColor, 0.0, 0);
    _gameView.update();
  }
  
  void resize(int width, int height)
  {
    _graphicsDevice.deleteDeviceChild(_viewportHandle);
    
    Map viewportSettings = {
      'x': 0,
      'y': 0,
      'width': width,
      'height': height
    };
    
    _viewportHandle = _graphicsDevice.createViewport('MainViewport', viewportSettings);
    
    _graphicsDevice.immediateContext.setViewport(_viewportHandle);
    
    print('resize: ${width}x${height}');
  }
  
  GameWindow get gameWindow => _gameWindow;
  
  GameView get gameView => _gameView;
  set gameView(GameView value) { _gameView = value; }
  
  //---------------------------------------------------------------------
  // Static methods
  //---------------------------------------------------------------------

  static void _onInitialize()
  {
    // Load the game settings
    GameSettings settings = new GameSettings('#settings');
    
    GamePad._onInitialize();
    
    // Create the game instance
    instance = new Game();
    
    GameWindow gameWindow = new GameWindow('#game', settings.width, settings.height);
    instance._gameWindow = gameWindow;
    
    // Create and register the GraphicsDevice
    Device graphicsDevice = new Device(gameWindow.context);
    instance._graphicsDevice = graphicsDevice;
    
    ServiceLocator._registerGraphicsDevice(graphicsDevice);
    
    // Call resize to create the viewport
    instance.resize(settings.width, settings.height);
  }
  
  static void _onUpdate(int time)
  {
    // Enable when Dartium gets Gamepad API
    //GamePad._onUpdate();

    instance.update(time);
  }
  
  static void _onResize(int width, int height)
  {
    instance.resize(width, height);
  }
    
  static void _createViewport(width, height)
  {
      
  }
}
