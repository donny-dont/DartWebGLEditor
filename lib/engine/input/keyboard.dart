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

class Keyboard
{
  /// The current state of the [Keyboard].
  static KeyboardState _keyboardState;
  
  //---------------------------------------------------------------------
  // Private methods
  //---------------------------------------------------------------------
  
  /**
   * Adds keyboard hooks to the specified [element].
   */
  static void _onInitialize(Element element)
  {
    _keyboardState = new KeyboardState();
    
    // Add hooks for keyboard events
    element.on.keyDown.add(_onKeyDown);
    element.on.keyUp.add(_onKeyUp);
  }
  
  /**
   * Removes keyboard hooks from the specified [element].
   */
  static void _onTerminate(Element element)
  {
    // Remove hooks for keyboard events
    element.on.keyDown.remove(_onKeyDown);
    element.on.keyUp.remove(_onKeyUp);
    
    _keyboardState = null;
  }

  /**
   * Callback for when a key is pressed.
   */
  static void _onKeyDown(KeyboardEvent event)
  {
    print('down: ${event.keyCode} ${event.keyIdentifier}');
  }
  
  /**
   * Callback for when a key is released.
   */
  static void _onKeyUp(KeyboardEvent event)
  {
    print('up: ${event.keyLocation} ${event.keyIdentifier}');    
  }
}
