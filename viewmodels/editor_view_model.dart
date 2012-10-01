
class EditorViewModel extends ViewModelBase
{
  Accordion _componentArea;
  TreeView _entityArea;
  WebGLRenderingContext _context;

  EditorViewModel()
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

    // Canvas events
    registerEventHandler('canvas_loaded', _canvasLoadedHandler);
    registerEventHandler('frame', _frameHandler);
  }

  //---------------------------------------------------------------------
  // Entity area handling
  //---------------------------------------------------------------------

  void _entityAreaLoadedHandler(TreeView source, _)
  {
    _entityArea = source;
  }

  void _entitySelectedHandler(_, __)
  {
    print('Selected');
    _componentArea.accordionItems.clear();
  }

  //---------------------------------------------------------------------
  // Component area handling
  //---------------------------------------------------------------------

  void _componentAreaLoadedHandler(Accordion source, _)
  {
    _componentArea = source;
  }

  //---------------------------------------------------------------------
  // File handling
  //---------------------------------------------------------------------

  void _newFileHandler(_, __)
  {
    print('New file');
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
    print('Adding box!');
  }

  void _addSphereHandler(_, __)
  {
    print('Adding sphere');
  }

  //---------------------------------------------------------------------
  // Canvas handling
  //---------------------------------------------------------------------

  void _canvasLoadedHandler(WebGLCanvas canvas, _)
  {
    _context = canvas.context;
  }

  void _frameHandler(_, FrameEventArgs e)
  {
    _context.clearColor(0.0, 0.0, 0.0, 1.0);
    _context.enable(WebGLRenderingContext.DEPTH_TEST);
    _context.depthFunc(WebGLRenderingContext.LEQUAL);
    _context.clear(WebGLRenderingContext.COLOR_BUFFER_BIT|WebGLRenderingContext.DEPTH_BUFFER_BIT);
  }
}
