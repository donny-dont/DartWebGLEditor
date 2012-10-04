
class EntityPropertiesViewModel extends PropertiesViewModelBase
{

  EntityPropertiesViewModel(){
    propertyViews['Entity Properties'] = new EntityProperties();
  }

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
