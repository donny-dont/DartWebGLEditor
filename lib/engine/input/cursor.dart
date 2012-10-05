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
 * Represents the image used for the mouse pointer.
 */
class Cursor
{
  /// The default cursor.
  static final Cursor auto = const Cursor('auto');
  
  /// Path to the cursor's image.
  final String _source;
  
  /**
   * Initializes a new instance of the [Cursor] class from the specified [source].
   */
  const Cursor(String this._source);
  
  /// Path to the cursor's image.
  String get source => _source;
}
