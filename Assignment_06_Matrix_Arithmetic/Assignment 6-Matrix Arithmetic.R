#1. Matrix Addition & Subtraction
A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)

#A + B
A_plus_B <- A + B
A_plus_B

#A - B
A_minus_B <- A - B
A_minus_B
#2. Create Diagonal Matrix
D <- diag(c(4, 1, 2, 3))
D
#3. Construct a Custom 5x5 Matrix
##First column
col1 <- c(3,2,2,2,2)

#Add diagonal matrix with 3s
diagonal3 <- diag(3,4)

#Add row of ones on top
newrow <-rbind(rep(1,4), diagonal3)

#combine to make matrix
new_matrix <-cbind(col1,newrow)

new_matrix
