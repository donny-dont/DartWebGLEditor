part of editor;

class TransformPropertiesViewModel extends ViewModelBase
{
  TransformModel _model;

  TransformPropertiesViewModel()
    : _model = new TransformModel()
  {
    registerEventHandler('position_changed', _positionChanged);
    registerEventHandler('rotation_changed', _rotationChanged);
    registerEventHandler('scale_changed', _scaleChanged);
  }

  void _positionChanged(_, Vector3ChangedEventArgs args){
    _model.position = args.value;
    vec3 value = args.value;
    print('Position transform changed! ${value.x} ${value.y} ${value.z}');
  }

  void _rotationChanged(_, Vector3ChangedEventArgs args){
    _model.rotation = args.value;
    vec3 value = args.value;
    print('Rotation transform changed! ${value.x} ${value.y} ${value.z}');
  }

  void _scaleChanged(_, Vector3ChangedEventArgs args){
    _model.scale = args.value;
    vec3 value = args.value;
    print('Scale transform changed! ${value.x} ${value.y} ${value.z}');
  }
}
