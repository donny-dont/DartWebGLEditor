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
 * The system window associated with a Game.
 */
class GameWindow implements IDisposable
{
  DivElement _div;
  CanvasElement _canvas;
  WebGLRenderingContext _context;
  Cursor _cursor;
  int _previousWidth;
  int _previousHeight;
  
  GameWindow(String id, int width, int height)
  {
    _div = document.query(id);
    _div.elements.clear();
    
    _div.style.width = '${width}px';
    _div.style.height = '${height}px';
    
    assert(_div != null);
    
    _canvas = new CanvasElement();
    _div.elements.add(_canvas);
    _div.on.mouseDown.add(_onMouseDown);
    
    _resize(width, height, false);
    
    // Set the cursor to the default
    cursor = Cursor.auto;
    
    // Create hooks for inputs
    Keyboard._onInitialize(_div);
    Mouse._onInitialize(_div);
    
    // Hook into the animation loop
    window.requestAnimationFrame(_updateLoop);
  }
  
  bool get isFullscreen => _div == document.webkitFullscreenElement;
  set isFullscreen(bool value)
  {
    bool isElementFullscreen = isFullscreen;
    
    if (value != isElementFullscreen)
    {
      if (value)
      {
        _previousWidth = _canvas.width;
        _previousHeight = _canvas.height;
        
        _div.on.fullscreenChange.add(_onFullscreenChange);
        _div.on.fullscreenError.add(_onFullscreenError);
        
        _div.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
      }
      else
      {
        document.webkitCancelFullScreen();
      }
    }
  }
  
  WebGLRenderingContext get context
  {
    if (_context == null)
    {
      _context = _canvas.getContext('experimental-webgl');
    }
    
    return _context;
  }
  
  bool get isMouseVisible => _div != document.webkitPointerLockElement;
  set isMouseVisible(bool value)
  {
    bool isElementPointerLocked = isMouseVisible;
    
    if (value != isElementPointerLocked)
    {
      if (value)
        document.webkitExitPointerLock();
      else
        _div.webkitRequestPointerLock();
    }
  }
  
  Cursor get cursor => _cursor;
  set cursor(Cursor value)
  {
    _cursor = value;
    
    String source = value.source;
    
    // Check to see if the source contains a period
    // Assume its a custom cursor if this is the case
    if (source.lastIndexOf('.') != -1)
      _div.style.cursor = 'url(${source}), auto';
    else
      _div.style.cursor = '${source} auto';
  }
  
  /**
   * Performs tasks associated with disposing of unmanaged resources.
   */
  void dispose()
  {
    // Remove hooks for inputs
    Keyboard._onTerminate(_div);
    Mouse._onTerminate(_div);
  }
  
  void _resize(int width, int height, [bool sendEvent = true])
  {
    String widthPixels = '${width}px';
    String heightPixels = '${height}px';
    
    _div.style.width = widthPixels;
    _div.style.height = heightPixels;
    
    _canvas.style.width = widthPixels;
    _canvas.style.height = heightPixels;
    
    _canvas.width = width;
    _canvas.height = height;
    
    // Notify the game that the canvas is resized
    if (sendEvent)
    {
      Game._onResize(width, height);
    }
  }
  
  void _removeFullscreenEvents()
  {
    _div.on.fullscreenChange.remove(_onFullscreenChange);
    _div.on.fullscreenError.remove(_onFullscreenError);
  }
  
  void _onMouseDown(MouseEvent event)
  {
    _div.focus();
  }
  
  void _onFullscreenChange(_)
  {
    if (isFullscreen)
    {
      Screen screen = window.screen;
      
      _div.focus();
      _resize(screen.width, screen.height);
    }
    else
    {
      _resize(_previousWidth, _previousHeight);
      
      _removeFullscreenEvents();
    }
  }
  
  void _onFullscreenError(_)
  {
    _removeFullscreenEvents();
  }
}

/**
 * Update loop for the application.
 *
 * This isn't in Game because GameWindow has a different
 * implementation for the tools code.
 */
bool _updateLoop(int time)
{
  Game._onUpdate(time);
  
  window.requestAnimationFrame(_updateLoop);
}
