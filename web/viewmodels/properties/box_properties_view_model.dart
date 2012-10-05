
class BoxPropertiesViewModel extends TransformPropertiesViewModel
{
  BoxPropertiesViewModel(){
    propertyViews['Box Properties'] = new BoxProperties();

    registerEventHandler('extents_changed', extents_changed);
  }

  void extents_changed(_, args){
    print('box extents changed!');
  }
}
