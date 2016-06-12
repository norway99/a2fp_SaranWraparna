final int NMODE = 0;
final int EMODE = 1;
int bX, bY, bwidth, bheight;
int b1X, b1Y;
int b2X;
int mode, numClicks;
boolean addNode, clickable;
boolean bt, gc, gr;
int numCols = 3;
NodeStack ns;
Graph me;

void setup(){ 
  size(600, 600);
  background(0);
  bX = bY = 10;
  b1X = b1Y = 50;
  b2X = 250;
  bwidth = 30;
  bheight = 15;  
  mode = NMODE;
  numClicks = 0;
  gc = false;
  bt = false;
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
  text("Backtracing Solution", b1X + 1, b1Y + 1);
  rect(b2X, b1Y, bwidth, bheight);
  text("Welsh-Powell Solution", b2X + 1, b1Y + 1);
  if (me._nodes.size() > 0)
    for (Node i : me._nodes)
      i.draw();
  if (addNode){
      me.addNode(mouseX, mouseY);
      addNode = false;
  }
  if (mode == EMODE){
    fill(0);
    text("Drawing nodes", 200, 100);
    fill(127);
    text("Drawing edges", 100, 100); 
  }
  if (mode == NMODE){
    fill(0);
    text("Drawing edges", 100, 100);
    fill(127);
    text("Drawing nodes", 200, 100);
  }    
  createEdge();
  if (gr && gc){
    fill(0);
    text("Drawing edges", 100, 100);
    fill(127);
    text("Please enter the desired number of colors", 300, 100);
    if (bt)
      backSolve();
    else
      welshPowellSolve();
    gc = false;
    clickable = false;
  }
  //if (solve())
    //text("Solved!", 500, 500);
}

boolean switchMode(){
  return mouseX >= bX && mouseX <= bX + bwidth &&
         mouseY >= bY && mouseY <= bY + bheight;
}  

boolean backTrace(){
  return mouseX >= b1X && mouseX <= b1X + bwidth &&
         mouseY >= b1Y && mouseY <= b1Y + bheight;
}

boolean welshPowell(){
  return mouseX >= b2X && mouseX <= b2X + bwidth &&
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

/*void keyPressed(){
  //String num = "number: ";
  if (gc && keyAnalyzer(key))
    //num += key;
  print ("hi");
  //numCols = Integer.parseInt(num);                        
}

boolean keyAnalyzer(char c){
  return c == '3';
}*/
   

Node findNode(){
  for (Node n : me._nodes)
    if (dist(mouseX, mouseY, n._x, n._y) < 10)
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
    if (numCols > me._nodes.size())
      text("Try again", 400, 100);
    else
      me.mcolor(numCols, 0);
}

void welshPowellSolve(){
  print("welsh powell"); // placeholder until wp algo is complete
}

  