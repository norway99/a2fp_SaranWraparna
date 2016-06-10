class Graph {
  ArrayList<Node> _nodes;
  int[][] _colors = 
  { 
    {255,0,0},   //red 
    {255,128,0}, //orange
    {255,255,0}, //yellow
    {0,255,0},   //green
    {0,255,255}, //cyan
    {0,0,255},   //blue
    {127,0,255}, //violet
    {255,0,127}, //magenta
    {102,51,0},  //brown
    {0,102,102}, //teal
  };
  
  Graph(){
    _nodes = new ArrayList<Node>();
  }
  
  void addNode(int x, int y){
    Node a = new Node(x, y);
    _nodes.add(a);
  }
  
  void addEdge(Node a, Node b){
    a.addNeighbor(b);
    b.addNeighbor(a);
  }
  
  boolean isSolved() {
    for (Node i : _nodes) {
      if (!(i._colored)) {
        return false;
      }
    }
    return true;
  }
   

  
  //void solve(int numColors) { //don't know if this should be void
  //}

}