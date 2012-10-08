
class EntityProperties extends PropertiesView
{
  EntityProperties() :
    super.fromResource('web/views/templates/entity_properties.xml')
  {
    ready.then((t) {
      t.dataContext = new EntityPropertiesViewModel();
    });
  }

  String get name => 'Entity';

  Future<String> get headerTemplate =>
    Template.getTemplate('web/views/templates/entity_header.xml');
}
