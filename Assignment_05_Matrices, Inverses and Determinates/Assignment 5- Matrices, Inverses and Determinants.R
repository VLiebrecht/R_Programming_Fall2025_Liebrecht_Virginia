# ASSIGNMENT 5-- MATRICES, INVERSES, AND DETERMINANTS
# Create the Matrices
A <- matrix(1:100,  nrow = 10)
B <- matrix(1:1000, nrow = 10)

#Inspect dimensions
dim(A)  # should be 10×10
dim(B)  # 10×100 — not square

#compute inverse and determinant
# For A
invA <- solve(A)
detA <- det(A)

#edit to deal with errors
invA <-tryCatch(solve(A), error=function(e) e)
detA <- tryCatch(det(A), error=function(e) e)

#Error recieved due to the matrix X being a singularity
# Although A is square, the columns are linearly dependent, thus A is singular with no inverse
# 0 being the detminant confirms singularity

# For B, use tryCatch to capture errors
invB <- tryCatch(solve(B), error = function(e) e)
detB <- tryCatch(det(B),   error = function(e) e)

##Error on invB as the matrix must be square for inverse
##Error on detB as determinant is defined only for a square matrix

invA
detA
invB
detB
