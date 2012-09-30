
class BoxVisualView extends View
{
  BoxVisualView()
    : super.fromTemplate('templates/box_visual.xml')
  {
    ready.then((_) {
      rootVisual.dataContext = new BoxVisualViewModel();
    });
  }
}
