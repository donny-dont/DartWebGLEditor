
class BoxVisualView extends View
{
  BoxVisualView(BoxVisualModel model)
    : super.fromTemplate('templates/box_visual.xml')
  {
    ready.then((t) {
      t.dataContext = new BoxVisualViewModel(model);
    });
  }
}
