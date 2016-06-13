
# Team SaranWraparna - Graph Vertex Coloring

Graph coloring is the act of assigning different colors to features, especially vertices on a graph; strategies to color these
vertices so that no connected pair have the same color are of great mathematical interest. The four-color
theorem states that any planar graph is four-colorable (though many graphs may only require three). We present an engine to color
planar graphs drawn by the user. Graphics are rendered in Processing, and the user may choose one of two different heuristics
(recursive backtracking and the Welsh-Powell algorithm) to color the graph.

## Installation

Pull the repository, open Processing, and run the file marked Driver.pde!

## Usage

Once the user runs the Driver file, a Processing window with black background and three gray
rectangles labeled "Switch Mode," "Backtracking Solution," and "Welsh-Powell Solution" should appear. The default mode
for the program is Node Mode. In Node Mode, the user can left-click with his/her mouse to create gray circular nodes
that will serve as the vertices for their graph. The user can click the "Switch Mode" button to switch to Edge Mode.
In Edge Mode, the user can select two previously created nodes to draw a white edge connecting the two. The
cursor must be within a radius of 15 pixels (for reference, the frame is 600 x 600) of a given node, or a
NullPointerException will be thrown. The user may toggle between Node and Edge modes as often as he/she likes. A text box
to the right of the "Switch Mode" button indicates the current mode.

When the user is satisfied with the graph that he/she has created, he/she can then click the "Backtracking" or "Welsh-Powell"
buttons in order to color the graph. In both scenarios, the user will be prompted by on-screen text to enter the number
of colors which he/she would like to use. The number that the user enters is reproduced in the command line for his/her benefit.
Once this information is received the graph will be colored according to the chosen algorithm. There is no discernible visual difference
between backtracking and Welsh-Powell, though for large, complicated graphs with many nodes and edges the latter may prove to be faster. 
Should the user enter a number of colors that is too small to color the entire graph (ie. 1, 2, or 3, depending on the situation), some
vertices will remain gray. The user can enter another number on his/her keyboard to recolor the graph according to the previously
selected algorithm. Similarly, should the user enter a number of colors that is larger than the number of nodes in his/her graph,
not all colors will be used.

The array of available colors is located in the Graph.pde file. Both algorithms begin at the first row of the 2D array and work downwards
linearly when selecting which colors to use.

Note that there is no undo/redo functionality as of now (hopefully this will be added soon). As of now, if the user wants to delete
an edge or node, he/she needs to close the window, run the Driver file again, and redraw the graph as desired. Also note that once the
graph has been colored, no nodes or edges may be added. As before, the file needs to be rerun to make further modifications to the graph.

## Contributors

Aparna Nair-Kanneganti and Sarah Yoon

Sources:
https://www.math.upenn.edu/~wilf/website/Backtracking%20II.pdf
http://www.maths.usyd.edu.au/MATH2069/r/graphlecs4pages.pdf
https://www.kleemans.ch/static/fourcolors/welsh-powell.pdf
