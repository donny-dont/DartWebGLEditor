#import('dart:html');
#import('package:dartnet_event_model/events.dart');
#import('package:dart_utils/web.dart');
#import('package:buckshot/buckshot.dart');
#import('package:buckshot/extensions/controls/accordion/accordion.dart');
#import('package:buckshot/extensions/controls/modal_dialog.dart');
#import('package:buckshot/extensions/controls/treeview/tree_view.dart');
#import('package:buckshot/extensions/controls/dock_panel.dart');
#import('package:buckshot/extensions/controls/tab_control/tab_control.dart');
#import('package:buckshot/extensions/controls/canvas/canvas_base.dart');
#import('package:buckshot/extensions/controls/canvas/webgl_canvas.dart');

#source('controls/vector3_input.dart');

#source('models/box_visual_model.dart');
#source('models/generated_mesh_model.dart');
#source('models/plane_visual_model.dart');
#source('models/sphere_visual_model.dart');

#source('views/assets_view.dart');
#source('views/box_visual_view.dart');
#source('views/editor_view.dart');

#source('viewmodels/box_visual_view_model.dart');
#source('viewmodels/editor_view_model.dart');
#source('viewmodels/generated_mesh_view_model.dart');
#source('viewmodels/plane_visual_view_model.dart');
#source('viewmodels/sphere_visual_view_model.dart');
#source('viewmodels/transform_view_model.dart');

void main()
{
  if (!reflectionEnabled){
    buckshot.registerElement(new Accordion.register());
    buckshot.registerElement(new AccordionItem.register());
    buckshot.registerElement(new TabControl.register());
    buckshot.registerElement(new TabItem.register());
    buckshot.registerElement(new TreeView.register());
    buckshot.registerElement(new TreeNode.register());
    buckshot.registerElement(new DockPanel.register());
    buckshot.registerElement(new WebGLCanvas.register());
    buckshot.registerElement(new Vector3Input.register());
  }

  //final AssetsView view = new AssetsView();
  final EditorView view = new EditorView();
  //final BoxVisualView view = new BoxVisualView(new BoxVisualModel());

  setView(view)
  .then((viewObject){
    bind(buckshot.windowWidthProperty,
        (viewObject.parent as Border).widthProperty);
    bind(buckshot.windowHeightProperty,
        (viewObject.parent as Border).heightProperty);
  });
}
