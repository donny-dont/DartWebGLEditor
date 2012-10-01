
class BoxVisualView extends View
{
  BoxVisualView(BoxVisualModel model)
    : super.fromTemplate('templates/box_visual.xml')
  {
    ready.then((_) {
      rootVisual.dataContext = new BoxVisualViewModel(model);
    });
  }
}
