class Graph {
  ArrayList<Node> _nodes;
  boolean solved;
  int[] _colors;
  
  void addNode() {
    Node a = new Node(mouseX, mouseY);
    _nodes.add(a);
  }
  
  void addEdge(Node a, Node b) {
    a.addNeighbor(b);
    b.addNeighbor(a);
  }
  
  void solve(int numColors) { //don't know if this should be void
  }

}