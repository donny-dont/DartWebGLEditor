
class PlaneEntityViewModel extends EntityViewModel
{
  PlaneEntityViewModel() :
    super(new PlaneVisualModel(), new PlanePropertiesViewModel()){
      entityName = 'Plane';
  }

  Future<String> get fileTemplate =>
      Template.getTemplate('web/views/templates/plane_icon.xml');

  Future<String> get folderTemplate =>
      Template.getTemplate('web/views/templates/plane_icon.xml');
}
