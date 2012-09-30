
class AssetsView extends View
{
  AssetsView()
    : super.fromTemplate('templates/assets.xml')
  {
    ready.then((_) {
      rootVisual.dataContext = new ViewModel();
    });
  }
}
