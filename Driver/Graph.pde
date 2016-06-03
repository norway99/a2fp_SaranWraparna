class Graph {
  ArrayList<Node> _nodes;
  boolean _solved;
  int[][][] _colors;
  
  Graph(){
    _nodes = new ArrayList<Node>();
    _solved = false;
    _colors = new int [255][255][255];
  }
  
  void addNode(int x, int y){
    Node a = new Node(x, y);
    _nodes.add(a);
  }
  
  void addEdge(Node a, Node b){
    a.addNeighbor(b);
    b.addNeighbor(a);
  }
  
  //void solve(int numColors) { //don't know if this should be void
  //}

}