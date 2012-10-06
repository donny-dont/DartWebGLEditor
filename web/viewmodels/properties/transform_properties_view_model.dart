
class TransformPropertiesViewModel extends EntityPropertiesViewModel
{
  TransformPropertiesViewModel(){
    propertyViews['Transform Properties'] = new TransformProperties();

    registerEventHandler('rotation_changed', rotation_changed);
    registerEventHandler('position_changed', position_changed);
    registerEventHandler('scale_changed', scale_changed);
  }

  void scale_changed(_, Vector3ChangedEventArgs args){
    vec3 value = args.value;
    print('Scale transform changed! ${value.x} ${value.y} ${value.z}');
  }

  void position_changed(_, Vector3ChangedEventArgs args){
    vec3 value = args.value;
    print('Position transform changed! ${value.x} ${value.y} ${value.z}');
  }

  void rotation_changed(_, Vector3ChangedEventArgs args){
    vec3 value = args.value;
    print('Rotation transform changed! ${value.x} ${value.y} ${value.z}');
  }
}
