
class SpherePropertiesViewModel extends TransformPropertiesViewModel
{
  FrameworkProperty radiusProperty;

  SpherePropertiesViewModel(){
    propertyViews['Sphere Properties'] = new SphereProperties();

    _initSphereViewModelProperties();
  }

  void _initSphereViewModelProperties(){
    radiusProperty = new FrameworkProperty(this, 'radius',
        propertyChangedCallback: valueChanged,
        defaultValue: '0');
  }

  void valueChanged(String value){
    num toNum = Vector3Input.validNum(value);

    print('Radius changed to: ${toNum}');
  }
}
