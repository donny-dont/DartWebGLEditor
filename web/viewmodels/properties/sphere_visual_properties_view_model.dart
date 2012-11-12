part of editor;

class SphereVisualPropertiesViewModel extends GeneratedMeshPropertiesViewModel
{
  FrameworkProperty radiusProperty;

  SphereVisualPropertiesViewModel()
    : super(new SphereVisualModel())
  {
    _initSphereViewModelProperties();
  }

  void _initSphereViewModelProperties()
  {
    radiusProperty = new FrameworkProperty(this, 'radius',
      propertyChangedCallback: valueChanged,
      defaultValue: '0');
  }

  void valueChanged(String value)
  {
    num toNum = _validNum(value);

    print('Radius changed to: ${toNum}');
  }
}
