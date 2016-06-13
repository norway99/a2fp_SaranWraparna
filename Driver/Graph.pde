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
   
  void welshpowell(int m) {
     for (Node a : _nodes)
       a._colored = false;
     int currColor = 0;
     PriorityQueue<Node> byDegree = new PriorityQueue<Node>();
     for (Node a : _nodes)
       byDegree.add(a);
     int ctr = _nodes.size();
     Node[] sorted = new Node[ctr];
     for (int i = 0; i < ctr; i++) 
       sorted[i] = byDegree.poll();
     while (currColor < m) {
       for (int i = 0; i < ctr; i++) {
         if (sorted[i]._colored)
           continue;
         if (isSafe(sorted[i], _colors[currColor]))
           sorted[i].setColor(_colors[currColor]);  
       }
     currColor++;
     }
  }  

}