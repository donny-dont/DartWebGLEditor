
class SphereEntityViewModel extends EntityViewModel
{
  SphereEntityViewModel() :
    super(new SphereVisualModel(), new SpherePropertiesViewModel()){
      entityName = 'Sphere';
  }

  Future<String> get fileTemplate =>
      Template.getTemplate('web/views/templates/sphere_icon.xml');

  Future<String> get folderTemplate =>
      Template.getTemplate('web/views/templates/sphere_icon.xml');
}
