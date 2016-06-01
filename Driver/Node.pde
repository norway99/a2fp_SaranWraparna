class Node {
  int _color;
  ArrayList<Node> _neighbors;
  
  Node() {
    _color = 255;
    _neighbors = new ArrayList<Node>();
  }
  
  int getColor() {
    return _color;
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