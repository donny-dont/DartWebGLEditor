library editor;

import 'dart:html';
import 'dart:json';
import 'dart:math';
import 'package:dartnet_event_model/events.dart';
import 'package:buckshot/buckshot_browser.dart';
import 'package:buckshot/web/web.dart';
import 'package:buckshot/extensions/controls/accordion/accordion.dart';
import 'package:buckshot/extensions/controls/modal_dialog.dart';
import 'package:buckshot/extensions/controls/treeview/tree_view.dart';
import 'package:buckshot/extensions/controls/dock_panel.dart';
import 'package:buckshot/extensions/controls/tab_control/tab_control.dart';
import 'package:buckshot/extensions/controls/canvas/canvas_base.dart';
import 'package:buckshot/extensions/controls/canvas/webgl_canvas.dart';
import 'package:spectre/spectre.dart';
import 'package:vector_math/vector_math_browser.dart';

//---------------------------------------------------------------------
// Game engine sources
//---------------------------------------------------------------------

part '../lib/engine/application/game.dart';
part '../lib/engine/application/game_settings.dart';
part '../lib/engine/application/game_view.dart';
part '../lib/engine/application/game_window.dart';

part '../lib/engine/entity/component.dart';
part '../lib/engine/entity/game_object.dart';
part '../lib/engine/entity/transform.dart';
part '../lib/engine/entity/visual.dart';

part '../lib/engine/foundation/iclonable.dart';
part '../lib/engine/foundation/idisposable.dart';
part '../lib/engine/foundation/player_index.dart';
part '../lib/engine/foundation/service_locator.dart';

part '../lib/engine/input/button_state.dart';
part '../lib/engine/input/cursor.dart';
part '../lib/engine/input/game_pad.dart';
part '../lib/engine/input/game_pad_state.dart';
part '../lib/engine/input/keyboard.dart';
part '../lib/engine/input/keyboard_state.dart';
part '../lib/engine/input/keys.dart';
part '../lib/engine/input/key_state.dart';
part '../lib/engine/input/mouse.dart';
part '../lib/engine/input/mouse_buttons.dart';
part '../lib/engine/input/mouse_state.dart';

//---------------------------------------------------------------------
// UI sources
//---------------------------------------------------------------------

part 'controls/num_validator.dart';
part 'controls/vector3_input.dart';

part 'models/box_visual_model.dart';
part 'models/sphere_visual_model.dart';
part 'models/plane_visual_model.dart';
part 'models/generated_mesh_model.dart';
part 'models/transform_model.dart';

part 'views/assets_view.dart';
part 'views/editor_view.dart';
part 'views/properties_view.dart';
part 'views/properties/box_visual_properties.dart';
part 'views/properties/entity_properties.dart';
part 'views/properties/plane_visual_properties.dart';
part 'views/properties/sphere_visual_properties.dart';
part 'views/properties/transform_properties.dart';

part 'viewmodels/editor_view_model.dart';
part 'viewmodels/entity_view_model.dart';
part 'viewmodels/properties/box_visual_properties_view_model.dart';
part 'viewmodels/properties/entity_properties_view_model.dart';
part 'viewmodels/properties/generated_mesh_properties_view_model.dart';
part 'viewmodels/properties/plane_visual_properties_view_model.dart';
part 'viewmodels/properties/sphere_visual_properties_view_model.dart';
part 'viewmodels/properties/transform_properties_view_model.dart';

void main()
{
  if (!reflectionEnabled){
    buckshot.registerElement(new Accordion.register());
    buckshot.registerElement(new TabControl.register());
    buckshot.registerElement(new TreeView.register());
    buckshot.registerElement(new DockPanel.register());
    buckshot.registerElement(new WebGLCanvas.register());
    buckshot.registerElement(new Vector3Input.register());
  }

  Template
    .deserialize('web/views/templates/resources.buckshot')
    .chain((_) => setView(new EditorView()))
    .then((viewObject){
      final rootParent = viewObject.parent as Border;

      //rootParent.background.value = getResource('theme_background_dark');

      bind(windowHeight, rootParent.height);
    });
}
