class BoxVisualProperties extends PropertiesView
{
  BoxVisualProperties()
    : super.fromResource('web/views/templates/box_visual_properties.xml')
  {
    ready.then((t) {
      t.dataContext = new BoxVisualPropertiesViewModel();
    });
  }

  String get name => 'Box Visual';

  Future<String> get headerTemplate =>
    Template.getTemplate('web/views/templates/box_visual_header.xml');
}
