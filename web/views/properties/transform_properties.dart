part of editor;

class TransformProperties extends PropertiesView
{
  TransformProperties()
    : super.fromResource('web/views/templates/transform_properties.xml')
  {
    ready.then((t) {
      t.dataContext.value = new TransformPropertiesViewModel();
    });
  }

  String get name => 'Transform';

  Future<String> get headerTemplate =>
    Template.getTemplate('web/views/templates/transform_header.xml');
}
