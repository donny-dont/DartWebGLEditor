
class EntityPropertiesViewModel extends PropertiesViewModelBase
{

  EntityPropertiesViewModel(){
    propertyViews['Entity Properties'] = new EntityProperties();

    registerEventHandler('texture_coords_changed', _textureCoordsHandler);
    registerEventHandler('normal_changed', _normalChangedHandler);
    registerEventHandler('tangent_changed', _tangentChangedHandler);
  }

  void _textureCoordsHandler(CheckBox checkBox, _)
  {
    if (checkBox.isChecked)
      print('Texcoords checked!');
    else
      print('Texcoords unchecked!');

    model.texCoords = checkBox.isChecked;
  }

  void _normalChangedHandler(CheckBox checkBox, _)
  {
    if (checkBox.isChecked)
      print('Normal checked!');
    else
      print('Normal unchecked!');

    model.normals = checkBox.isChecked;
  }

  void _tangentChangedHandler(CheckBox checkBox, _)
  {
    if (checkBox.isChecked)
      print('Tangent checked!');
    else
      print('Tangent unchecked!');

    model.tangents = checkBox.isChecked;
  }
}
