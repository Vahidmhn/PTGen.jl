# PTGen
This package provides a function which generates all vertices of a polytope created by the intersection of constraints As:

$ Ax <= b  $.

The function's name is PTVer and it needs two inputs including the matrix A and vector b. It also has two key arguments; "inf" and "Neighbors". "inf" determines the infinity of the space and is needed when the polytope is not closed and has the default value of 1e9. "Neighbor", however, gets a logical value (true/false) and determines the format of the output the fuction returns. If this key argument is set to false (which is the default value), the function just will return a matrix whose rows are the vertices. Whereas, the function has the ability to return the vertices along with their adjacent vertices ("adj") as well and this requires to set the key "Neighbor" to true. This output can be used to visualize the polytope. Following is an example of using this function in different forms and outputs:

A=[1   1
 -1   0
  0  -1];

b= [5 0 0];

PTVer(A,b)

 0.0  5.0
 5.0  0.0
 0.0  0.0


PTVer(A,b, Neighbor=true)


PTGen.VerticeType[3]
PTGen.VerticeType
Point → Float64[2]
0.00
5.00
adj → Int64[2]
J → Int64[2]
PTGen.VerticeType
Point → Float64[2]
5.00
0.00
adj → Int64[2]
PTGen.VerticeType
Point → Float64[2]
0.00
0.00
adj → Int64[2]
J → Int64[2]

