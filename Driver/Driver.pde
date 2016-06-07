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
  me = new Graph();
}

void draw(){
  rect(bX, bY, bwidth, bheight);
  text("edge mode", bX + 1, bY + 1);
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
  if (graphComplete){
    //me.solve();
    text("graphy graph", 100, 100); // text for debug purposes
    clickable = false;
  }
}

Node findNode(){
  for (Node n : me._nodes){
    int nX = n._x - mouseX;
    int nY = n._y - mouseY;
    if (sqrt(sq(nX) + sq(nY)) < 5)
      return n;
  }
  return null;
}

void mousePressed(){
  if (clickable){
    if (mouseX >= b1X && mouseX <= b1X + bwidth &&
        mouseY >= b1Y && mouseY <= b1Y + bheight)
      graphComplete = true;
    else if (mouseX >= bX && mouseX <= bX + bwidth &&
             mouseY >= bY && mouseY <= bY + bheight)
      mode = EMODE;
    else if (mode == NMODE)
      addNode = true;
    else if (mode == EMODE && numClicks < 2){
      ns.push(findNode());
      ++numClicks;
    }
    else
      ;
  }
}

void createEdge(){
  if (numClicks == 2){
    Node one = ns.pop();
    Node two = ns.pop();
    line(one._x, one._y, two._x, two._y);
    //me.addEdge(one, two);
    numClicks = 0;
  }
}
    

  
    
  

  
  
  
  
  