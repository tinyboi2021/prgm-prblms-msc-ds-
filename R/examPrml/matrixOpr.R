mat1=matrix((1:12),nrow = 3,ncol = 4,byrow = TRUE )
print(mat1)

print(mat1[2,3])
print(mat1[1:2])

print(nrow(mat1))
print(ncol(mat1))
print(dim(mat1))
print(dim(mat1)[[2]])
print(class(mat1))
print(typeof(mat1))

for(i in seq(nrow(mat1))){
  for(j in seq(ncol(mat1))){
    print(mat1[i,j])
  }
}



m<- 1:10
dim(m) <- c(2, 5)
print(m)

x <- 1:3
y <- 10:12
cbind(x, y) 
rbind(x, y)

print(m)
print(m[,1])
print(m[1,])
print(m[,1:3])

new_row=c(55,66,77,88,99)
m<-rbind(m[1,],new_row,m[2,])
print(m)

new_col=c(0,0,0)
m<-cbind(m[,1],new_col,m[,2:5])
print(m)

print(m[,-6])

pos <- which(m == 5, arr.ind = TRUE)
print(pos)

sort_m<-matrix(sort(m),nrow=nrow(m),ncol=ncol(m),byrow = TRUE)
print(sort_m)

m2<-matrix(seq(10,90,10),nrow=3,ncol=3)
print(m2)
m3<-cbind(m,m2)
print(m3)

