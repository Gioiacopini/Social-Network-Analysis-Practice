#House Keepign 
#set working directory
#install igraph
#load the data


library(igraph)
data<- name_of_dataset

#convert data into matrix
data.mat<- as.matrix(name_of_dataset)

#convert matrix into igraph object 
g<- graph.edgelist(data.mat, directed = FALSE)

#make a basic plot of the network
plot(g)

V(g) #view vertices
E(g) #view edges

#count edges
gsize(g) 

#count vertices
gorder(g)

#how to add attributes to vertices in the network and view them

#inspect the objects "attribute1" and "attribute2"
attribute1 
attribute2  

#create a new vertex attribute called "attribute1"

g<- set_vertex_attr(g, "attribute1", value=attribute1)

#create a new vertex attribute called "attribute2"

g<- set_vertex_attr(g, "attribute2", value= attribute2)

#view all vertex attributes in a list 
vertex_attr(g)

#view attributes of first 5 vertices in data frame
V(g)[[1:5]]

#how to add attributes to edges in the network and view them. 

#the edge attribute needs to exist for it to be added to the network

#create a new edge attribute called "edge_attr"

g<-set_edge_attribute(g, "edge_attr", value=edge_attr)

#view all edge attributes of g 

edge_attr(g)

#find all edges that include "name"
E(g)[[inc("name")]]

#find all pairs whose edge attribute is > x
E(g)[[edge_attr>4]]

#VISUALISING ATTRIBUTES

#create a new igraph object. (Two data frames need to be given "data1_edges" with all the edges in the network with their attributes and "data1_nodes" containing all the nodes in the network with their attributes. 

g1<- graph_from_data_frame(d= data1_edges, vertices= data1_nodes, directed=FALSE)

#subset edges greater than or equal to 5
E(g1)[[edge_attr >= 5 ]]

#plot network and color vertices by attributes (ex:by gender)

V(g1)$color<- ifelse(V(g)$attribute=="female", "orange", "dodgerblue")

plot(g1, vertex.label.color="black")

