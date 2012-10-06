
class TransformModel
{
  vec3 _position;
  vec3 _rotation;
  vec3 _scale;

  TransformModel();

  vec3 get position => _position;
  set position(vec3 value)
  {
    _position = value;

    _setTransform();
  }

  vec3 get rotation => _rotation;
  set rotation(vec3 value)
  {
    _rotation = value;

    _setTransform();
  }

  vec3 get scale => _scale;
  set scale(vec3 value)
  {
    _scale = value;

    _setTransform();
  }

  void _setTransform()
  {

  }
}
