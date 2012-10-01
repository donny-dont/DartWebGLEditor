
class BoxVisualViewModel extends GeneratedMeshViewModel
{
  BoxVisualViewModel(BoxVisualModel model)
    : super(model)
  {
    registerEventHandler('extents_changed', _extentsHandler);
  }

  void _extentsHandler(_, VectorChangedEventArgs args)
  {
    print('${args.x} ${args.y} ${args.z}');
  }
}
