#import('dart:html');
#import('package:buckshot/buckshot.dart');
#import('package:buckshot/extensions/controls/accordion/accordion.dart');
#import('package:buckshot/extensions/controls/modal_dialog.dart');
#import('package:buckshot/extensions/controls/treeview/tree_view.dart');
#import('package:buckshot/extensions/controls/dock_panel.dart');
#import('package:buckshot/extensions/controls/tab_control/tab_control.dart');
#import('package:buckshot/extensions/controls/canvas/webgl_canvas.dart');

#source('views/assets_view.dart');
#source('views/box_visual_view.dart');
#source('views/editor_view.dart');

#source('viewmodels/box_visual_view_model.dart');
#source('viewmodels/generated_mesh_view_model.dart');
#source('viewmodels/plane_visual_view_model.dart');
#source('viewmodels/sphere_visual_view_model.dart');
#source('viewmodels/transform_view_model.dart');
#source('viewmodels/view_model.dart');

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
  }

  //final AssetsView view = new AssetsView();
  //final EditorView view = new EditorView();
  final BoxVisualView view = new BoxVisualView();

  setView(view)
  .then((_){
    // Since we want the app to take up the entire browser window,
    // we'll setup some manual bindings to the implicit Border
    // that our view is contained within.

    new Binding(buckshot.windowWidthProperty,
        (view.rootVisual.parent as Border).widthProperty);

    new Binding(buckshot.windowHeightProperty,
        (view.rootVisual.parent as Border).heightProperty);
  });
}
