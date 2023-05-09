n=c(1,2,3)
m = c('andy','gg','supa')
l = list(3.4, n, m)
l = list(l,n)
l = list(l,l)

v1=c(2,4,5)
v2=c('a','b','gdsa','ba')
a=array(c(v1,v2),dim = 2)
a
# Create a matrix
# Create a matrix
m <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3)
m[1, 2]
m[2, 3]

for(i in 1:15){
	if(i%%2==0)
		next
	print(i)
}
seq(1,5,length.out=10)

#22/03
udf=data.frame(x=(1:10), y = seq(21,30), z=seq(5,14))
udf
apply(udf,1,sum)
apply(udf,1,mean)
apply(udf, 2, mean)
apply(udf, 2, class)
apply(udf, 2, summary)
lapply(udf, summary)

new_list=list(mat1=matrix(c(2,3), 2,2), mat2=matrix(c(1,2,3,4), 2,2), mat3=matrix(c(1,2,3), 2, 3))
new_list
lapply(new_list, sum)
lapply(new_list, "[",,2)
lapply(new_list, "[", 1,)
lapply(new_list, sum, 1,5)
