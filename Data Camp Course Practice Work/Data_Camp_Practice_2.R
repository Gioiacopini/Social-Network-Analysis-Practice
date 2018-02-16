#Network Visualisation Techniques

#most commonly adjusted features of networks are SIZE, LABELS, COLOR, SHAPE, EDGES

### Modifying those features can help in conveying information to the audience###

# for example, larger vertices are generally the most central ones in the networks.

#how to create effective network visuals in igraph  

#Plot g1 in a circle layout

plot(g1, vertex.label.color="black", layout=layout_in_circle(g1))

# Plot the graph object g1 in a Fruchterman-Reingold layout

plot(g1, vertex.label.color = "black", layout =layout_with_fr(g1))

# Plot the graph object g1 in a Tree layout 
m <- layout_as_tree(g1)
plot(g1, vertex.label.color = "black", layout = m)

# Plot the graph object g1 using igraph's chosen layout 

m1<- layout_nicely(g1)

plot(g1, vertex.label.color = "black", layout = m1)

### HOW TO CHANGE THE SIZE OF EDGES BASED ON THEIR WEIGHT AND REMOVE CERTAIN EDGES S TO BETTER VISUALISE A NETWORK 

## Create a vector of weights based on the number of (edge_attr = hours) each pair spend together

w1 <- E(g1)$egde_attr

# Plot the network varying edges by weights

m1 <- layout_nicely(g1)

plot(g1, 
        vertex.label.color = "black", 
        edge.color = 'black',
        edge.width = w1,
        layout = m1)


# Create a new igraph object only including edges from the original graph that are greater than 2 hours long 
g2 <- delete_edges(g1, E(g1)[hours < 2])


# Plot the new graph 
w2 <- E(g2)$hours
m2 <- layout_nicely(g2)

plot(g2, 
     vertex.label.color = "black", 
     edge.color = 'black',
     edge.width = w2,
     layout = m2)
