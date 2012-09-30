

class ViewModel extends ViewModelBase
{
  WebGLRenderingContext _context;

  ViewModel()
  {
    print('viewmodel');
    registerEventHandler('loaded', initializeHandler);
    registerEventHandler('frame', frameHandler);
  }

  void initializeHandler(WebGLCanvas canvas, _)
  {
    _context = canvas.context;
  }

  void frameHandler(_, FrameEventArgs e)
  {
    _context.clearColor(1.0, 0.0, 1.0, 1.0);
    _context.enable(WebGLRenderingContext.DEPTH_TEST);
    _context.depthFunc(WebGLRenderingContext.LEQUAL);
    _context.clear(WebGLRenderingContext.COLOR_BUFFER_BIT|WebGLRenderingContext.DEPTH_BUFFER_BIT);
  }
}
