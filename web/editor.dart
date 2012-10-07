#import('dart:html');
#import('dart:json');
#import('dart:math');
#import('package:dartnet_event_model/events.dart');
#import('package:buckshot/web/web.dart');
#import('package:buckshot/buckshot.dart');
#import('package:buckshot/extensions/controls/accordion/accordion.dart');
#import('package:buckshot/extensions/controls/modal_dialog.dart');
#import('package:buckshot/extensions/controls/treeview/tree_view.dart');
#import('package:buckshot/extensions/controls/dock_panel.dart');
#import('package:buckshot/extensions/controls/tab_control/tab_control.dart');
#import('package:buckshot/extensions/controls/canvas/canvas_base.dart');
#import('package:buckshot/extensions/controls/canvas/webgl_canvas.dart');
#import('package:spectre/spectre.dart');
#import('package:dartvectormath/vector_math_html.dart');

//---------------------------------------------------------------------
// Game engine sources
//---------------------------------------------------------------------

#source('../lib/engine/application/game.dart');
#source('../lib/engine/application/game_settings.dart');
#source('../lib/engine/application/game_view.dart');
#source('../lib/engine/application/game_window.dart');

#source('../lib/engine/foundation/iclonable.dart');
#source('../lib/engine/foundation/idisposable.dart');
#source('../lib/engine/foundation/player_index.dart');
#source('../lib/engine/foundation/service_locator.dart');

#source('../lib/engine/input/button_state.dart');
#source('../lib/engine/input/cursor.dart');
#source('../lib/engine/input/game_pad.dart');
#source('../lib/engine/input/game_pad_state.dart');
#source('../lib/engine/input/keyboard.dart');
#source('../lib/engine/input/keyboard_state.dart');
#source('../lib/engine/input/keys.dart');
#source('../lib/engine/input/key_state.dart');
#source('../lib/engine/input/mouse.dart');
#source('../lib/engine/input/mouse_buttons.dart');
#source('../lib/engine/input/mouse_state.dart');

//---------------------------------------------------------------------
// UI sources
//---------------------------------------------------------------------

#source('controls/num_validator.dart');
#source('controls/vector3_input.dart');

#source('models/box_visual_model.dart');
#source('models/sphere_visual_model.dart');
#source('models/plane_visual_model.dart');
#source('models/generated_mesh_model.dart');
#source('models/empty_visual_model.dart');
#source('models/transform_model.dart');

#source('views/assets_view.dart');
#source('views/editor_view.dart');
#source('views/properties/entity_properties.dart');
#source('views/properties/transform_properties.dart');
#source('views/properties/box_properties.dart');
#source('views/properties/sphere_properties.dart');
#source('views/properties/plane_properties.dart');

#source('viewmodels/editor_view_model.dart');
#source('viewmodels/entity_view_model.dart');
#source('viewmodels/properties/transform_properties_view_model.dart');
#source('viewmodels/properties/sphere_properties_view_model.dart');
#source('viewmodels/properties/box_properties_view_model.dart');
#source('viewmodels/properties/plane_properties_view_model.dart');
#source('viewmodels/properties/entity_properties_view_model.dart');
#source('viewmodels/properties/properties_view_model_base.dart');
#source('viewmodels/properties/empty_properties_view_model.dart');
#source('viewmodels/box_entity_view_model.dart');
#source('viewmodels/sphere_entity_view_model.dart');
#source('viewmodels/plane_entity_view_model.dart');


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

  //final AssetsView view = new AssetsView();
  final EditorView view = new EditorView();
  //final BoxVisualView view = new BoxVisualView(new BoxVisualModel());

  setView(view)
  .then((viewObject){
    bind(buckshot.windowHeightProperty,
        (viewObject.parent as Border).heightProperty);
  });
}
