final int NMODE = 0;
final int EMODE = 1;
int bX, bY, bwidth, bheight;
int b1X, b1Y;
int mode, numClicks;
boolean addNode, graphComplete, clickable;
NodeStack ns;
Graph me;

void setup(){ 
  size(600, 600);
  background(0);
  bX = bY = 10;
  b1X = b1Y = 50;
  bwidth = 30;
  bheight = 15;  
  mode = NMODE;
  numClicks = 0;
  graphComplete = false;
  addNode = false;
  clickable = true;
  ns = new NodeStack();
  me = new Graph();
}

void draw(){
  rect(bX, bY, bwidth, bheight);
  text("switch mode", bX + 1, bY + 1);
  fill(127);
  rect(b1X, b1Y, bwidth, bheight);
  text("done", b1X + 1, b1Y + 1);
  fill(127);
  createEdge();
  if (addNode){
      me.addNode(mouseX, mouseY);
      addNode = false;
  }
  if (mode == EMODE)
    text("mode is emode", 100, 100); // text for debug purposes
  //if (mode == NMODE)
    //text("mode is nmode", 200, 100); // text for debug purposes
  if (graphComplete){
    //me.solve();
    text("graphy graph", 300, 100); // text for debug purposes
    clickable = false;
  }
  if (solve()) {
    text("solved!", 300, 200);
  }
}

Node findNode(){
  for (Node n : me._nodes){
    if (dist(mouseX, mouseY, n._x, n._y) < 10){
      //print("found node");
      return n;
    }
  }
  return null;
}

boolean graphComplete(){
  return mouseX >= b1X && mouseX <= b1X + bwidth &&
         mouseY >= b1Y && mouseY <= b1Y + bheight;
}

boolean switchMode(){
  return mouseX >= bX && mouseX <= bX + bwidth &&
         mouseY >= bY && mouseY <= bY + bheight;
}  

void mousePressed(){
  if (clickable){
    if (graphComplete()){
      graphComplete = true;
      solve();
    }
    else if (switchMode()){
      if (mode == NMODE)
        mode = EMODE;
      else
        mode = NMODE;
    }
    else if (mode == NMODE)
      addNode = true;
    else if (mode == EMODE && numClicks < 2){
      ns.push(findNode());
      ++numClicks;
    }
  }    
}

void createEdge(){
  if (numClicks == 2){
    Node one = ns.pop();
    Node two = ns.pop();
    stroke(255);
    line(one._x, one._y, two._x, two._y);
    me.addEdge(one, two);
    numClicks = 0;
  }
}

boolean isSafe(Node a, int[] c) {
  for(Node i: a._neighbors) {
    if (i.sameColor(c)) {
      return false;
    }
  }
  return true;
}

boolean mcolor(Node curr) {
    if (me.isSolved()) {
      return true;
    }
    for (int[] c: me._colors) {
      if (isSafe(curr,c)) {
        curr.setColor(c);
        for(Node next: curr._neighbors) {
          if (mcolor(next)) {
            return true;
          }
        }
      }
    }
    return false;
}

boolean solve() {
  mcolor(me._nodes.get(0));
  return true;
}


    

  
    
  

  
  
  
  
  