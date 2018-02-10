#house keeping - set working directory 
#Read data 

gang<- read.csv("LONDON_GANG.csv", header = TRUE)

#transfort the data into a martix
gang_matrix<-as.matrix(gang)

#balance the matrix by removing the first column 
gang_matrix<-gang_matrix[, -1]

#Convert the matrix values to numeric 
class(gang_matrix)<- "numeric"

#convert the matrix to binary data. 1s and 2s will be converted to 0s and 3s and 4s will the converted to 1s.
#this is becasue we want a network of gang members that commit serious crimes together. 
#this way we create an adjecency matrix
gang_matrix[gang_matrix < 3]<- 0
gang_matrix[gang_matrix >= 3]<- 1

#plot the network
install.packages("igraph")
library(igraph)

#check the number of connections in the the network by summing the 1s found the rows 
rowSums(gang_matrix)

#plot the matrix 
gang.adj <- graph_from_adjacency_matrix(gang_matrix, mode = "undirected",diag = FALSE)
plot(gang.adj)

#identify centrality in the network
#DEGREE CENTRALITY (identify the person with the most connections)

gang_degree<- degree(gang.adj)
gang_degree #offender 14 is the one with the higher degree centrality being connected to 7 other criminals.
max(gang_degree)
#CLOSENESS (how many steps it takes to reach every member of the network. the higher the value the more central is the node or criminal)

gang_close<- closeness(gang.adj)
gang_close
max_closeness <-max(gang_close)

#calculate average closeness
gang.close.avg = 1 / (gang_close * nrow(gang_matrix))
gang.close.avg

##Plot the centrality of the network using closeness
plot(gang.adj, vertex.size = gang_close * 25000, main = "closeness")


##BETWEENESS
gang.between <- betweenness(gang.adj)
gang.between

### Plot the centrality of the network using betweenness
plot(gang.adj, vertex.size = gang.between * .1, main = "betweenness")

### Calculate page rank
gang.rank <- page.rank(gang.adj, directed = FALSE)$vector
gang.rank
## Plot page rank
plot(gang.adj, vertex.size = gang.rank * 500, edge.width = 1)

## Combine matrices
gang.combined <- cbind(gang_degree, gang.close.avg, gang.between, gang.rank)
gang.combined
