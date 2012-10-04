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

class GameSettings
{
  static final int _defaultWidth = 640;
  static final int _defaultHeight = 480;

  int _width;
  int _height;

  GameSettings(String id)
  {
    ScriptElement script = document.query(id) as ScriptElement;

    if ((script == null) || (script.type != 'application/json'))
    {
      _setDefaults();
    }
    else
    {
      _readJSON(script.innerHTML);
    }
  }

  GameSettings.fromJSON(String json)
  {
    _readJSON(json);
  }

  int get width => _width;
  int get height => _height;

  void _readJSON(String json)
  {
    Map settings = JSON.parse(json) as Map;

    if (settings != null)
    {
      // Get width
      int widthValue = settings['width'];
      _width = (widthValue != null) ? widthValue : _defaultWidth;

      // Get height
      int heightValue = settings['height'];
      _height = (heightValue != null) ? heightValue : _defaultHeight;
    }
    else
    {
      _setDefaults();
    }
  }

  void _setDefaults()
  {
    _width = _defaultWidth;
    _height = _defaultHeight;
  }
}
