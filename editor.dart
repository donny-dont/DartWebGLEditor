#import('dart:html');
#import('package:Buckshot/buckshot.dart');
#import('package:Buckshot/lib/extensions/controls/modal_dialog.dart');
#import('package:Buckshot/lib/extensions/controls/treeview/tree_view.dart');
#import('package:Buckshot/lib/extensions/controls/dock_panel.dart');

#source('views/editor_view.dart');
#source('viewmodels/view_model.dart');

void main()
{
  if (!reflectionEnabled){
    buckshot.registerElement(new TreeView.register());
    buckshot.registerElement(new TreeNode.register());
    buckshot.registerElement(new DockPanel.register());
  }

  final EditorView view = new EditorView();

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
