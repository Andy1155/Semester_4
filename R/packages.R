hypotenuse = function(x,y){
  sqrt(x^2+y^2)
}

pythagorean_triples = data.frame(
  x = c(1,2,3,4,5,6),
  y = c(10,11,12,13,14,15),
  z = c(23,24,25,26,27,28)
)
package.skeleton(
  "Pythogorus",
  c("hypotenuse", "pythagorean_triples")
)