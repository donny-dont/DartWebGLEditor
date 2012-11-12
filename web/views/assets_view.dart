part of editor;

class AssetsView extends View
{
  AssetsView()
    : super.fromTemplate('web/views/templates/assets.buckshot')
  {
    ready.then((_) {
      //rootVisual.dataContext = new ViewModel();
    });
  }
}
