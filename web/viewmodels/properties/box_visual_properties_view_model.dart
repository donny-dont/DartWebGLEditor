
class BoxVisualPropertiesViewModel extends GeneratedMeshPropertiesViewModel
{
  BoxVisualPropertiesViewModel()
    : super(new BoxVisualModel())
  {
    registerEventHandler('extents_changed', _extentsChanged);
  }

  void _extentsChanged(_, Vector3ChangedEventArgs args)
  {
    BoxVisualModel boxVisual = _model as BoxVisualModel;
    boxVisual.extents = args.value;
  }
}
