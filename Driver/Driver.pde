final int NMODE = 0;
final int EMODE = 1;
int bX, bY, bwidth, bheight;
int b1X, b1Y;
int mode, numClicks;
boolean addNode, graphComplete, clickable;
int numCols = 3;
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
  fill(127);
  rect(bX, bY, bwidth, bheight);
  text("Switch Mode", bX + 1, bY + 1);
  rect(b1X, b1Y, bwidth, bheight);
  text("Graph Complete", b1X + 1, b1Y + 1);
  createEdge();
  if (me._nodes.size() > 0)
    for (Node i : me._nodes)
      i.draw();
  if (addNode){
      me.addNode(mouseX, mouseY);
      addNode = false;
  }
  if (mode == EMODE)
    text("Drawing edges", 100, 100); // text for debug purposes
  if (mode == NMODE)
    text("Drawing nodes", 200, 100); // text for debug purposes
  if (graphComplete){
    text("Please enter the desired number of colors", 300, 100);
    solve();
    graphComplete = false;
    clickable = false;
  }
  //if (solve())
    //text("Solved!", 500, 500);
}

Node findNode(){
  for (Node n : me._nodes)
    if (dist(mouseX, mouseY, n._x, n._y) < 10)
      return n;
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
    if (graphComplete())
      graphComplete = true;
    if (switchMode()){
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

/*void keyPressed(){
  String num = "number: ";
  if (graphComplete && keyAnalyzer(key))
    num += key;
  print (num);
  numCols = Integer.parseInt(num);                        
}

boolean keyAnalyzer(char c){
  return c == '2';
}*/
    

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

boolean solve() {
    if (numCols > me._nodes.size())
      text("Try again", 400, 100);
    return me.mcolor(numCols, 0);
}
  