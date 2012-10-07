
class EntityViewModel extends ViewModelBase
{
  /**
   * Entity properties associated with the Entity.
   */

  /**
   * Transform associated with the Entity.
   */
  TransformProperties _transform;
  /**
   * Reference to the child ViewModels of this EntityViewModel.
   *
   * List is empty if no children are associated.
   */
  List<PropertiesView> components;

  EntityViewModel()
    : _transform = new TransformProperties()
    , components = new List<PropertiesView>()
  {
    components.add(_transform);
  }

  TransformProperties get transform => _transform;
}
