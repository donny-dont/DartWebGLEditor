
class GeneratedMeshViewModel extends ViewModelBase
{
  GeneratedMeshViewModel()
  {
    print('HIII');
    registerEventHandler('selectionchanged', _textureCoordsHandler);
    registerEventHandler('normal_changed', _normalChangedHandler);
    registerEventHandler('tangent_changed', _tangentChangedHandler);
  }

  void _textureCoordsHandler(CheckBox checkBox, _)
  {
    print('i r here');
    if (checkBox.isChecked)
      print('Texcoords checked!');
    else
      print('Texcoords unchecked!');
  }

  void _normalChangedHandler(CheckBox checkBox, _)
  {
    if (checkBox.isChecked)
      print('Normal checked!');
    else
      print('Normal unchecked!');
  }

  void _tangentChangedHandler(CheckBox checkBox, _)
  {
    if (checkBox.isChecked)
      print('Tangent checked!');
    else
      print('Tangent unchecked!');
  }
}
