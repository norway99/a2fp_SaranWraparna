class Node{
  boolean _colored;
  int[] _color;
  final int [] defaultcol = {100, 100, 100};
  int _x, _y;
  ArrayList<Node> _neighbors;
  
  Node(int x, int y) {
    _colored = false;
    _x = x;
    _y = y;
    _color = new int [3];
    setColor(defaultcol);
    _neighbors = new ArrayList<Node>();
  }
  
  void setColor(int[] c) {
    for (int i=0; i<3; i++)
      _color[i] = c[i];
    _colored = true;
  }
  
  void draw() { 
    fill(_color[0], _color[1], _color[2]);
    ellipse(_x, _y, 15, 15);
  }

  void addNeighbor(Node a) {
    _neighbors.add(a);
  }
  
  boolean sameColor(int[] c) {
    for (int i=0; i<3; i++)
      if (_color[i] != c[i])
        return false;
    return true;
  }
  
  String strNode() {
    return " ( " + _x + " , " + _y + " ) ";
  } 
  
  int compareTo(Node other) {
    if (other._neighbors.size() == _neighbors.size())
      return 0;
    else if (other._neighbors.size() < _neighbors.size()) 
      return -1;
    else
      return 1;
  }
  
}