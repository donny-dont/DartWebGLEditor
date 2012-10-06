
class BoxEntityViewModel extends EntityViewModel
{
  BoxEntityViewModel() :
    super(new BoxVisualModel(), new BoxPropertiesViewModel()){
      propertyVM.entityName = 'Box';
  }

  Future<String> get fileTemplate =>
      Template.getTemplate('web/views/templates/box_icon.xml');

  Future<String> get folderTemplate =>
      Template.getTemplate('web/views/templates/box_icon.xml');
}
