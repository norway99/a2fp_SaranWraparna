class NodeStack {
  
  ArrayList<Node> _arr;
  
  NodeStack(){
    _arr = new ArrayList();
  }
  
  void push(Node n){
    _arr.add(n);
  }
  
  Node pop(){
    Node me = _arr.get(_arr.size()-1);
    _arr.remove(_arr.size()-1);
    return me;
  }
  
  Node peek(){
    return _arr.get(_arr.size()-1);
  }

}
    