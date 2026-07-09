#file A2_aXXXXXXX.R  
#Example R script for Assignment 2 (practica1)


# Part (a) sample size function
proportion_ss <- function(alpha,p,delta){
	z_value <- qnorm(1-(alpha/2))
	n <- ((z_value/delta)^2)*p*(1-p)
	return(ceiling(n))
}

# Part (b)
proportion_ss(0.05,0.2,0.1)

# Part (c)(i)  sample size plot 
p <- seq(0.1,0.9,length=50)
n <- proportion_ss(0.05,p,0.1)
plot(n ~ p,type="l",ylab="Sample size (n)",xlab="proportion (p)")

# Part (c)(ii)
proportion_ss(0.05,0.6,0.1)

# Part (d)(i) sample size plot for various delta
n1 <- proportion_ss(0.05,p,0.05) #sample size for delta=0.05
n2 <- proportion_ss(0.05,p,0.08) #sample size for delta=0.08
n3 <- proportion_ss(0.05,p,0.1)  #sample size for delta=0.1

plot(n1 ~ p,type="l",ylab="Sample size (n)",xlab="proportion (p)",ylim=c(0,400))
lines(p,n2,col="blue")
lines(p,n3,col="red")
legend("topright",c("delta=0.05","delta=0.08","delta=0.1"),col=c("black","blue","red"),lwd=1)

# Part (d)(ii)
proportion_ss(0.05,0.5,0.07)

# Part (e)(i)  
n <- 100
p <- 0.5
round(qnorm(0.975)*sqrt((p*(1-p))/n),2)

# Part (e)(ii)
delta <- 0.08
a <- (qnorm(0.975)/delta)^2
round((a + c(-1,1)*sqrt((a^2)-(4*n*a)))/(2*a),2)
