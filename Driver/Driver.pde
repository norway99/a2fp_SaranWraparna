import java.util.*;

final int NMODE = 0;
final int EMODE = 1;
int bX, bY, bwidth, bheight;
int b1X, b1Y;
int b2X;
int mode, numClicks;
boolean addNode, clickable;
boolean bt, gc, gr;
int numCols = 0;
Stack<Node> ns;
Graph me;

void setup(){ 
  size(600, 600);
  background(0);
  bX = bY = 20;
  b1Y = 100;
  b1X = 250;
  bwidth = 30;
  bheight = 15;  
  mode = NMODE;
  numClicks = 0;
  gc = false;
  bt = false;
  addNode = false;
  clickable = true;
  ns = new Stack<Node>();
  me = new Graph();
}

void draw(){
  fill(127);
  rect(bX, bY, bwidth, bheight);
  text("Switch Mode", bX + 1, bY - 5);
  rect(bX, b1Y, bwidth, bheight);
  text("Backtracking Solution", bX + 1, b1Y - 5);
  rect(b1X, b1Y, bwidth, bheight);
  text("Welsh-Powell Solution", b1X + 1, b1Y - 5);
  if (me._nodes.size() > 0)
    for (Node i : me._nodes)
      i.draw();
  if (addNode){
      me.addNode(mouseX, mouseY);
      addNode = false;
  }
  if (mode == EMODE){
    fill(0);
    text("Drawing nodes", 100, bY - 5);
    fill(127);
    text("Drawing edges", 100, bY - 5); 
  }
  if (mode == NMODE){
    fill(0);
    text("Drawing edges", 100, bY - 5);
    fill(127);
    text("Drawing nodes", 100, bY - 5);
  }    
  createEdge();
  if (gr && gc){
    clickable = false;
    fill(0);
    text("Drawing edges", 100, 100);
    fill(127);
    text("Please enter the desired number of colors", bX, 200);
    if (bt)
      backSolve();
    else
      welshPowellSolve();
  }
}

boolean switchMode(){
  return mouseX >= bX && mouseX <= bX + bwidth &&
         mouseY >= bY && mouseY <= bY + bheight;
}  

boolean backTrace(){
  return mouseX >= bX && mouseX <= bX + bwidth &&
         mouseY >= b1Y && mouseY <= b1Y + bheight;
}

boolean welshPowell(){
  return mouseX >= b1X && mouseX <= b1X + bwidth &&
         mouseY >= b1Y && mouseY <= b1Y + bheight;
}

void mousePressed(){
  if (clickable){
    if (backTrace()){
      bt = true;
      gc = true;
    }
    if (welshPowell())
      gc = true;
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

void keyPressed(){
  String num = "";
  if (gc && keyAnalyzer(key)){
    num += key;
    numCols = Integer.parseInt(num);  
    print("You entered: " + numCols + " \n");
  }
}

boolean keyAnalyzer(char c){
  return c >= '1' && c <= '9';
}
   

Node findNode(){
  for (Node n : me._nodes)
    if (dist(mouseX, mouseY, n._x, n._y) < 15)
      return n;
  return null;
}

void createEdge(){
  if (numClicks == 2){
    Node one = ns.pop();
    Node two = ns.pop();
    stroke(255);
    line(one._x, one._y, two._x, two._y);
    stroke(0);
    me.addEdge(one, two);
    numClicks = 0;
    gr = true;
  }
}

void backSolve(){
  if (numCols != 0)
    me.mcolor(numCols, 0);
}

void welshPowellSolve(){
  if (numCols != 0)
    me.welshpowell(numCols);
}

  