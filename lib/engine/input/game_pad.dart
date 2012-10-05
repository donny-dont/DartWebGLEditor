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
 * Allows retrieval of user action with a game pad.
 */
class GamePad
{
  /// The current [GamePad] states.
  static List<GamePadState> _gamePadStates;

  /**
   * Gets the current state of a game pad at the given [index].
   *
   * Returns a new instance of the [GamePadState]. Use
   * [copyGamePadState] if creating garbage is a concern.
   */
  static GamePadState getGamePadState(PlayerIndex index)
  {
    return _gamePadStates[index.value].clone();
  }

  /**
   * Gets the current state of a game pad at the given [index].
   *
   * Copies the values into [gamePadState].
   */
  static void copyGamePadState(PlayerIndex index, GamePadState gamePadState)
  {
    _gamePadStates[index.value].cloneTo(gamePadState);
  }

  //---------------------------------------------------------------------
  // Private methods
  //---------------------------------------------------------------------

  static void _onInitialize()
  {
    _gamePadStates = new List<GamePadState>();

    int size = PlayerIndex.Size.value;

    for (int i = 0; i < size; ++i)
    {
      _gamePadStates.add(new GamePadState());
    }
  }

  static void _onUpdate()
  {
    Navigator nav = window.navigator;
    List<Gamepad> gamepads = window.navigator.webkitGetGamepads();

    int size = PlayerIndex.Size.value;

    for (int i = 0; i < size; ++i)
    {
      Gamepad gamepad = gamepads[i];
      GamePadState gamePadState = _gamePadStates[i];

      if (gamepad != null)
      {
        gamePadState._update(gamepad);
      }
      else
      {
        if (gamePadState.isConnected)
        {
          gamePadState._disconnect();
        }
      }
    }
  }
}
