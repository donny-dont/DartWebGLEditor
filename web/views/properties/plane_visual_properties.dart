
class PlaneVisualProperties extends PropertiesView
{
  PlaneVisualProperties()
    : super.fromResource('web/views/templates/plane_visual_properties.xml')
  {
    ready.then((t) {
      t.dataContext = new PlaneVisualPropertiesViewModel();
    });
  }

  String get name => 'Plane Visual';

  Future<String> get headerTemplate =>
    Template.getTemplate('web/views/templates/plane_visual_header.xml');
}
