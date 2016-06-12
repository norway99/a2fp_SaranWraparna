import java.util.*;
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
    
  boolean mcolor(int m, int vnum){
    if (vnum == _nodes.size()) 
      return true;
    Node curr = _nodes.get(vnum);
    for (int c = 0; c < m; ++c)
      if (isSafe(curr, _colors[c])) {
        curr.setColor(_colors[c]);
        if (mcolor(m, vnum + 1))
          return true;
      }
    return false;
  }
  
  boolean isSafe(Node a, int[] c){
    for(Node i: a._neighbors)
      if (i.sameColor(c))
        return false;
    return true;
   } 
   
   void welshpowell() {
     int currColor = 0;
     PriorityQueue<Node> bydegree = new PriorityQueue<Node>();
     for (Node a: _nodes) {
       bydegree.add(a);
     }
     int ctr = _nodes.size();
     Node[] sorted = new Node[ctr];
     for (int i=0; i<ctr; i++) {
       sorted[i] = bydegree.poll();
     }
     // works up to here!
  
     //I think there's a runaway loop here...
     while (ctr > 0) {
       for (Node i : sorted) {
         if (i._colored) {
           continue;
         }
         if (isSafe(i,_colors[currColor])) {
           i.setColor(_colors[currColor]);
           ctr--;
         }
       }
       currColor++;
     }
   }
}