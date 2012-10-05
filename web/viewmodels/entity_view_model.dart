
/**
 * Base class that represents content, properties, and operations for an entity.
 */
abstract class EntityViewModel extends ViewModelBase
{
  /** The model to be used by this entity */
  final GeneratedMeshModel model;

  /** The property view model to be used by this entity */
  final EntityPropertiesViewModel propertyVM;

  /** FrameworkProperty that represents the entity friendly name */
  FrameworkProperty entityNameProperty;

  /** Reference to the parent of this EntityViewModel.  Null if no parent. */
  EntityViewModel parent;

  /** The icon template to be used when the entity has no children. */
  abstract Future<String> get fileTemplate;

  /** The icon template to be used when the entity has children. */
  abstract Future<String> get folderTemplate;

  /**
   * Reference to the child EntityViewModel's of this EntityViewModel.
   *
   * List is empty if not children are associated.
   */
  List<EntityViewModel> children = new List<EntityViewModel>();

  /**
   * Constructs an view model to manage entity properties and operations.
   */
  EntityViewModel(GeneratedMeshModel this.model, this.propertyVM){

    // you will do the bulk of your interaction with the model
    // from the propertyVM, since it will be holding all the bindings
    // to the various properties in the UI.
    //
    // So in BoxPropertiesViewModel, make interact with the model for those
    // properties, in TransformPropertiesViewMdoel, do the same for transforms
    // etc... all of them will be working on the same object since they are
    // scaffolded together.
    propertyVM.model = model;

    _initializeEnityViewModelProperties();
  }

  _initializeEnityViewModelProperties(){
    entityNameProperty = new FrameworkProperty(this, 'entityName',
        defaultValue: '');
  }

  String get entityName => getValue(entityNameProperty);
  set entityName(String value) => setValue(entityNameProperty, value);

}