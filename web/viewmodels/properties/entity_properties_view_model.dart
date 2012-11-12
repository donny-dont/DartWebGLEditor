part of editor;

class EntityPropertiesViewModel extends ViewModelBase
{
  FrameworkProperty entityNameProperty;

  EntityPropertiesViewModel(){
    _initEntityPropertiesViewModelProperties();
  }

  String get entityName => getValue(entityNameProperty);
  set entityName(String value) => setValue(entityNameProperty, value);

  void _initEntityPropertiesViewModelProperties(){
    entityNameProperty = new FrameworkProperty(this, 'entityName');
  }
}
