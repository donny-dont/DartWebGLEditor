
class EditorView extends View
{
  EditorView()
    : super.fromTemplate('templates/editor.xml')
  {
    // When the view is ready, bind the viewmodel to the root object's
    // dataContext.  This crucial step is what allows the view model to
    // bind with the template.
    ready.then((_){
      rootVisual.dataContext = new EditorViewModel();
    });
  }
}
