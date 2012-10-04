
abstract class PropertiesViewModelBase extends ViewModelBase
{
  /**
   * A map representing the names and View objects that make up the
   * entire property layout.
   *
   * Each inheriting class should add one or more Views to this.
   */
  Map<String, View> propertyViews = new Map<String, View>();

  /**
   * The model associated with this view model.
   */
  GeneratedMeshModel model;

  /**
   * Sets **this** as dataContext on all views in the [propertyViews] map.
   *
   * Should be called after construction in order to initialize all
   * scoffolded views to the correct view model.
   */
  Future setDataContext(){
    return Futures
            .wait(propertyViews.getValues().map((f) => f.ready))
            .chain((results){
              results
                .forEach((element){
                  element.dataContext = this;
                });
              return new Future.immediate(true);
            });
  }
}
