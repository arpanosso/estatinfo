n = 100
m = 171.70
sigma = 7.79
alpha = .05
m + qnorm(c(alpha/2, 1-alpha/2))*sigma/sqrt(n)


n=10
m=46.9
sd=43.3
alpha =.1
m+qt(c(alpha/2, 1-alpha/2),n-1)*sd/sqrt(n)


n=400
x=320
ph = 320/400

ph + qnorm(c(alpha/2, 1-alpha/2))*sqrt(.8*.2/n)
