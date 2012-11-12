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
 * Specifies the game pad associated with a player.
 */
class PlayerIndex
{
  /// The first player.
  static final PlayerIndex One = const PlayerIndex(0);
  /// The second player.
  static final PlayerIndex Two = const PlayerIndex(1);
  /// The third player.
  static final PlayerIndex Three = const PlayerIndex(2);
  /// The fourth player.
  static final PlayerIndex Four = const PlayerIndex(3);
  /// The number of enumerations.
  static final PlayerIndex Size = const PlayerIndex(4);
  
  final int value;
  
  const PlayerIndex(int this.value);

} // end class PlayerIndex
