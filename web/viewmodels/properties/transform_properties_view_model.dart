
class TransformPropertiesViewModel extends EntityPropertiesViewModel
{
  TransformPropertiesViewModel(){
    propertyViews['Transform Properties'] = new TransformProperties();

    registerEventHandler('rotation_changed', rotation_changed);
    registerEventHandler('position_changed', position_changed);
    registerEventHandler('scale_changed', scale_changed);
  }

  void scale_changed(_, VectorChangedEventArgs args){

  print('>> changed!');
  }

  void position_changed(_, VectorChangedEventArgs args){

    print('>> changed!');
  }

  void rotation_changed(_, VectorChangedEventArgs args){

    print('>> changed!');
  }
}