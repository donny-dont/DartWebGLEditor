
class EntityViewModel extends ViewModelBase
{
  /**
   * Entity properties associated with the Entity.
   */
  EntityProperties _entity;
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
    : _entity = new EntityProperties()
    , _transform = new TransformProperties()
    , components = new List<PropertiesView>()
  {
    components.add(_entity);
    components.add(_transform);
  }

  EntityProperties get entityProperties => _entity;
  TransformProperties get transform => _transform;
}
