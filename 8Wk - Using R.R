print("hello world")
"print"
"helloworld"

#1.
a <- c(1L, 13L, 8L, 4L, 5L)
b <- c(6L, 11L, 3L, 9L, 10L)
c <- c(12L, 7L, 2L, 14L, 15L)

num_matrix <- cbind(a,c,b)
nummatrix <- matrix(num_matrix,nrow=5, ncol=3)
nummatrix

plot(nummatrix, type = "b", col="green", pch=1, xlab="a Vector", ylab="c Vector")
?plot

#2.
Name <- c("Arturo", "Jordan", "Mike", "Leah", "Alice")
Age <- c(25L,32L,43L,23L,30L)
Role <- c("Nurse","Eye Surgeon", "Nurse", "Midwife", "Pediatrician")
Service_Length <- c(2L,10L,15L,2L,7L)

df <- data.frame(Name, Age, Role, Service_Length)
df

#3.
library(ggplot2)
x <-seq(1:20)
y <- x^2
qplot(x, y, geom="point", color = "green")

#4.
barplot(
  Service_Length, names.arg = Name,
  col = "red", xlab = "Employees", ylab = "Years of Service",
  main = "TTA Hospital")

#5.
Qname <- readline("Enter your name:")
Qage <- readline("Enter your age:")

Intro <- paste("Hello", Qname, "You are", Qage, "years old")
print(Intro)

#6.
Seq6 <- seq(20,50)

mean(Seq6)
sum(Seq6)

#7.
Random_vect <- c(runif(10, min = -50, max = 50))