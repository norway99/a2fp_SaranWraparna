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
    //a.draw();
    _nodes.add(a);
  }
  
  void addEdge(Node a, Node b){
    a.addNeighbor(b);
    b.addNeighbor(a);
  }
  
  boolean isSolved() {
    for (Node i : _nodes) 
      if (!(i._colored)) 
        return false;
    return true;
  }
  
  boolean mcolor(Node curr) {
    if (isSolved()) {
      return true;
    }
    for (int[] c: _colors)
      if (isSafe(curr,c)) {
        curr.setColor(c);
        for(Node next: curr._neighbors)
          if (mcolor(next)) 
            return true;
      }
    return false;
  }
  
  boolean solve() {
    //print("hi");
    //print(me._nodes.get(0).strNode());
    mcolor(me._nodes.get(0));
    return true;
  }
  
  boolean isSafe(Node a, int[] c) {
    for(Node i: a._neighbors)
      if (i.sameColor(c))
        return false;
    return true;
   } 

}