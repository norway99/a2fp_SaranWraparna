class Node{

  int _color, _x, _y;
  ArrayList<Node> _neighbors;
  
  Node(int x, int y) {
    ellipse(x, y, 15, 15);
    _x = x;
    _y = y;
    _color = 255;
    fill(_color);
    _neighbors = new ArrayList<Node>();
  }
  
  void setColor(int c) {
    _color = c;
  }
  
  Node getNeighbor(int i) {
    return _neighbors.get(i);
  }
  
  void addNeighbor(Node a) {
    _neighbors.add(a);
  }
  
}