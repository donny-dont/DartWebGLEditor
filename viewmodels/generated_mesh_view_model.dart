
class GeneratedMeshViewModel extends ViewModelBase
{
  GeneratedMeshModel _meshModel;

  GeneratedMeshViewModel(GeneratedMeshModel this._meshModel)
  {
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

    _meshModel.texCoords = checkBox.isChecked;
  }

  void _normalChangedHandler(CheckBox checkBox, _)
  {
    if (checkBox.isChecked)
      print('Normal checked!');
    else
      print('Normal unchecked!');

    _meshModel.normals = checkBox.isChecked;
  }

  void _tangentChangedHandler(CheckBox checkBox, _)
  {
    if (checkBox.isChecked)
      print('Tangent checked!');
    else
      print('Tangent unchecked!');

    _meshModel.tangents = checkBox.isChecked;
  }
}
