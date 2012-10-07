
class TransformProperties extends PropertiesView
{
  TransformProperties()
    : super.fromResource('web/views/templates/transform_properties.xml')
  {
    ready.then((t) {
      t.dataContext = new TransformPropertiesViewModel();
    });
  }

  String get name => 'Transform';
}
