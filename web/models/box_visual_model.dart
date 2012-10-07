
class BoxVisualModel extends GeneratedMeshModel
{
  vec3 _extents;

  BoxVisualModel();

  vec3 get extents => _extents;
  set extents(vec3 value)
  {
    _extents = value;

    generateMesh();
  }

  void generateMesh() { }
}
