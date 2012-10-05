
class EditorViewModel extends ViewModelBase
{
  Accordion _componentArea;
  TreeView _entityArea;
  WebGLRenderingContext _context;
  final EditorView _view;

  TreeNode _currentNode;

  // special top-level node
  final _scene = new TreeNode()..header = 'Scene';

  EditorViewModel(this._view)
  {
    // Entity tree-view
    registerEventHandler('entity_area_loaded', _entityAreaLoadedHandler);
    registerEventHandler('entity_selected', _entitySelectedHandler);

    // Component accordion
    registerEventHandler('component_area_loaded', _componentAreaLoadedHandler);

    // File events
    registerEventHandler('new_file_clicked', _newFileHandler);
    registerEventHandler('save_file_clicked', _saveFileHandler);

    // Model events
    registerEventHandler('add_box_clicked', _addBoxHandler);
    registerEventHandler('add_sphere_clicked', _addSphereHandler);
    registerEventHandler('add_plane_clicked', _addPlaneHandler);

    // Canvas events
    registerEventHandler('canvas_loaded', _canvasLoadedHandler);
    registerEventHandler('frame', _frameHandler);

    // Zoidberg
    registerEventHandler('zoidberg', zoidberg);

  }

  /** Initialized the editor to a starting state */
  void initEditor(){
    assert(_entityArea != null);
    assert(_componentArea != null);

    _entityArea.children.clear();
    _componentArea.accordionItems.clear();

    // start with an "Scene" object as our top level, so that
    // there is a way to add new object to the top level.

    _entityArea.children.add(_scene);
    _currentNode = _scene;
  }

  //---------------------------------------------------------------------
  // Entity area handling
  //---------------------------------------------------------------------

  void _entityAreaLoadedHandler(TreeView source, _)
  {
    if (_entityArea != null) return;
    _entityArea = source;

    // TODO (JOHN) need a better way to know when the entire view is loaded
    // instead of knowing the last piece of content that is loaded, which
    // can prove to be unreliable if the template is changed.
    initEditor();
  }

  void _entitySelectedHandler(_, TreeNodeSelectedEventArgs args)
  {
    if (args.node == _scene){
      _currentNode = _scene;
      _componentArea.accordionItems.clear();
      return;
    }

    _currentNode = args.node;

    _updateUITo(_currentNode);
  }

  //---------------------------------------------------------------------
  // Component area handling
  //---------------------------------------------------------------------

  void _componentAreaLoadedHandler(Accordion source, _)
  {
    if (_componentArea != null) return;
    _componentArea = source;
  }

  //---------------------------------------------------------------------
  // File handling
  //---------------------------------------------------------------------

  void _newFileHandler(_, __)
  {
    initEditor();
  }

  void _saveFileHandler(_, __)
  {
    print('Saving file');
  }

  //---------------------------------------------------------------------
  // Model handling
  //---------------------------------------------------------------------

  void _addBoxHandler(_, __)
  {
    addEntity(new BoxEntityViewModel());
  }

  void _addSphereHandler(_, __)
  {
    addEntity(new SphereEntityViewModel());
  }

  void _addPlaneHandler(_, __){
    addEntity(new PlaneEntityViewModel());
  }

  /** Adds an [entityVM] to the application and updates the UI. */
  void addEntity(EntityViewModel entityVM){
    // something should always be selected (_scene is default)
    assert(_currentNode != null);


    Futures
      .wait([entityVM.fileTemplate, entityVM.folderTemplate])
      .chain((result){
        return Futures.wait(result.map((r) => Template.deserialize(r)));
      })
      .then((results){
        // Using the tag property to hold a reference to the entity view model
        // object.
        final node = new TreeNode()
          ..header = entityVM.entityName
          ..tag = entityVM
          ..fileIcon = results[0]
          ..folderIcon = results[1];

        if (_currentNode != _scene){
          // setup the relationships
          entityVM.parent = _currentNode.tag;
          _currentNode.tag.children.add(entityVM);
        }

        _currentNode.childNodes.add(node);
        _currentNode.childVisibility = Visibility.visible;
        _currentNode = node;

        _updateUITo(_currentNode);
      });


  }

  //---------------------------------------------------------------------
  // UI layout handling
  //---------------------------------------------------------------------

  void _updateUITo(TreeNode node){
    _componentArea.accordionItems.clear();

    if (node == null || node == _scene || node.tag == null){
      _currentNode = _scene;
      return;
    }

    final evm = node.tag as EntityViewModel;

    evm
      .propertyVM
      .setDataContext()
      .then((_){
        Futures
          .wait(evm.propertyVM.propertyViews.getValues().map((v) => v.ready))
          .then((_){
            evm
            .propertyVM
            .propertyViews
            .forEach((String name, View view){
              final ai = new AccordionItem()
                                ..header = name
                                ..body = view.rootVisual;

              _componentArea.accordionItems.add(ai);
            });
          });
      });
    }


  //---------------------------------------------------------------------
  // Canvas handling
  //---------------------------------------------------------------------

  void _canvasLoadedHandler(WebGLCanvas canvas, _)
  {
    _context = canvas.context;

    // Updated the surface dimension to whatever the canvas size is in the DOM
    canvas
      .updateMeasurementAsync
      .then((ElementRect r){
        canvas.surfaceHeight = r.bounding.height;
        canvas.surfaceWidth = r.bounding.width;
      });
  }

  void _frameHandler(_, FrameEventArgs e)
  {
    _context.clearColor(0.0, 0.0, 0.0, 1.0);
    _context.enable(WebGLRenderingContext.DEPTH_TEST);
    _context.depthFunc(WebGLRenderingContext.LEQUAL);
    _context.clear(WebGLRenderingContext.COLOR_BUFFER_BIT|WebGLRenderingContext.DEPTH_BUFFER_BIT);
  }

  void zoidberg(_, __){
    new View
      .fromTemplate("<image sourceuri='web/resources/for_don.jpg' />")
      .ready
      .chain((t){
        final md = new ModalDialog.with("Nobody!", t, ModalDialog.Ok);
        return md.show();
      });
  }
}
