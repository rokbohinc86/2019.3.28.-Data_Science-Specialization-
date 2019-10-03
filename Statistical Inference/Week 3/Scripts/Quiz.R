# Q1
1100 + c(-1,1) * qt(0.975,df=9-1) * 30/sqrt(9)
# Q2
2*sqrt(9)/qt(0.975,df=9-1)
# Q4
Sp=sqrt(0.64)
(3-5) + c(-1,1)*qt(0.975,df=18)Sp*sqrt(1/5)
#Q6
n=100
Sx=0.5
Sy=2
S=sqrt((Sx^2+Sy^2)/n)
df=(Sx^2+Sy^2)^2/(Sx^4+Sy^4)*n-1
2+c(-1,1)*qt(0.95, df = df)*S
#Q7
n = 9
x=-3
y= 1
sx=1.5
sy=1.8
S <- sqrt((sx^2+sy^2)/n)
x-y + c(-1,1)*qt(0.95, df = 2*n-2)*S



