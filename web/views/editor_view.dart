part of editor;

class EditorView extends View
{
  EditorView()
    : super.fromTemplate('web/views/templates/editor.buckshot')
  {
    // When the view is ready, bind the viewmodel to the root object's
    // dataContext.  This crucial step is what allows the view model to
    // bind with the template.
    ready.then((t){
      t.dataContext.value = new EditorViewModel(this);
    });
  }
}
