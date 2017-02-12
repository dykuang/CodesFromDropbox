####### Modified on June 22, 2015 #########
################### Plots for contours and marginals for all 13 Normal and Schizophrenic overlaid ####



par(mfrow=c(1,1))

pdf("contours.pdf")

#############################
#############################
##### landmark 1 ########

par(fig=c(0,1,.7,1))
par(mar=c(0,5,2,2))

plot(N1[[1]]$x,N1[[1]]$y,xaxt="n", xlim=c(-1.0,1.0),
ylim=c(-1.0,1.0),type="l",lty=1,lwd=2,
xlab="X", 
ylab="Y",
main=""

)
text(.2,0.9,substitute("95 % HPD contours"))
text(.8,-0.9,substitute("horizontal axis: X"))
lines(S1[[1]]$x,S1[[1]]$y,lty=6,lwd=2,col="2")


### x ##
par(fig=c(0,1,.4,.7),new=T)
par(mar=c(0,5,0,2))
ymax=max(density(pred_XN1)$y,density(pred_XS1)$y)

plot(density(pred_XN1),lty=1,lwd=2,col=1,xaxt="n",
xlim=c(-1.0,1.0),
ylim=c(0,ymax+1), 

ylab="predictive density",main=""

)
 text(0.9,.5,substitute("X direction"))
lines(density(pred_XS1),lty=6,lwd=2, col=2)

legend("topright",c("N1","S1"),lty=c(1,6),lwd=c(2,2),col=c(1,2))

### Y #########
par(fig=c(0,1,0,0.4),new=T)
par(mar=c(5,5,0,2))
ymax=max(density(pred_YN1)$y,density(pred_YS1)$y)

plot(density(pred_YN1), lty=1,lwd=2,col=1, xlim=c(-1.0,1.0), ylim=c(0,ymax+1),xlab="vector", ylab="predictive density",main="")

 text(0.9,0.5,substitute("Y direction"))
lines(density(pred_YS1),lty=6,lwd=2, col=2)
########################
########################

##### landmark 2 #############
par(fig=c(0,1,.7,1))
par(mar=c(0,5,2,2))

plot(N2[[1]]$x,N2[[1]]$y,xaxt="n", xlim=c(-1.0,1.0),
ylim=c(-1.0,1.0),type="l",lty=1,lwd=2,
xlab="X", 
ylab="Y",
main=""

)
text(.2,0.9,substitute("95 % HPD contours"))
text(.8,-0.9,substitute("horizontal axis: X"))
lines(S2[[1]]$x,S2[[1]]$y,lty=6,lwd=2,col="2")


### x ##
par(fig=c(0,1,.4,.7),new=T)
par(mar=c(0,5,0,2))
ymax=max(density(pred_XN2)$y,density(pred_XS2)$y)

plot(density(pred_XN2),lty=1,lwd=2,col=1,xaxt="n",
xlim=c(-1.0,1.0),
ylim=c(0,ymax+1), 

ylab="predictive density",main=""

)
 text(0.9,.5,substitute("X direction"))
lines(density(pred_XS2),lty=6,lwd=2, col=2)

legend("topright",c("N2","S2"),lty=c(1,6),lwd=c(2,2),col=c(1,2))

### Y #########
par(fig=c(0,1,0,0.4),new=T)
par(mar=c(5,5,0,2))
ymax=max(density(pred_YN2)$y,density(pred_YS2)$y)

plot(density(pred_YN2), lty=1,lwd=2,col=1, xlim=c(-1.0,1.0), ylim=c(0,ymax+1),xlab="vector", ylab="predictive density",main="")

 text(0.9,0.5,substitute("Y direction"))
lines(density(pred_YS2),lty=6,lwd=2, col=2)
########################
########################


###########landmark 3###############
par(fig=c(0,1,.7,1))
par(mar=c(0,5,2,2))

plot(N3[[1]]$x,N3[[1]]$y,xaxt="n", xlim=c(-1.0,1.0),
ylim=c(-1.0,1.0),type="l",lty=1,lwd=2,
xlab="X", 
ylab="Y",
main=""

)
text(.2,0.9,substitute("95 % HPD contours"))
text(.8,-0.9,substitute("horizontal axis: X"))
lines(S3[[1]]$x,S3[[1]]$y,lty=6,lwd=2,col="2")


### x ##
par(fig=c(0,1,.4,.7),new=T)
par(mar=c(0,5,0,2))
ymax=max(density(pred_XN3)$y,density(pred_XS3)$y)

plot(density(pred_XN3),lty=1,lwd=2,col=1,xaxt="n",
xlim=c(-1.0,1.0),
ylim=c(0,ymax+1), 

ylab="predictive density",main=""

)
 text(0.9,.5,substitute("X direction"))
lines(density(pred_XS3),lty=6,lwd=2, col=2)

legend("topright",c("N3","S3"),lty=c(1,6),lwd=c(2,2),col=c(1,2))

### Y #########
par(fig=c(0,1,0,0.4),new=T)
par(mar=c(5,5,0,2))
ymax=max(density(pred_YN3)$y,density(pred_YS3)$y)

plot(density(pred_YN3), lty=1,lwd=2,col=1, xlim=c(-1.0,1.0), ylim=c(0,ymax+1),xlab="vector", ylab="predictive density",main="")

 text(0.9,0.5,substitute("Y direction"))
lines(density(pred_YS3),lty=6,lwd=2, col=2)
##################################
##################################


###########landmark 4###############
par(fig=c(0,1,.7,1))
par(mar=c(0,5,2,2))

plot(N4[[1]]$x,N4[[1]]$y,xaxt="n", xlim=c(-1.0,1.0),
ylim=c(-1.0,1.0),type="l",lty=1,lwd=2,
xlab="X", 
ylab="Y",
main=""

)
text(.2,0.9,substitute("95 % HPD contours"))
text(.8,-0.9,substitute("horizontal axis: X"))
lines(S4[[1]]$x,S4[[1]]$y,lty=6,lwd=2,col="2")


### x ##
par(fig=c(0,1,.4,.7),new=T)
par(mar=c(0,5,0,2))
ymax=max(density(pred_XN4)$y,density(pred_XS4)$y)

plot(density(pred_XN4),lty=1,lwd=2,col=1,xaxt="n",
xlim=c(-1.0,1.0),
ylim=c(0,ymax+1), 

ylab="predictive density",main=""

)
 text(0.9,.5,substitute("X direction"))
lines(density(pred_XS4),lty=6,lwd=2, col=2)

legend("topright",c("N4","S4"),lty=c(1,6),lwd=c(2,2),col=c(1,2))

### Y #########
par(fig=c(0,1,0,0.4),new=T)
par(mar=c(5,5,0,2))
ymax=max(density(pred_YN4)$y,density(pred_YS4)$y)

plot(density(pred_YN4), lty=1,lwd=2,col=1, xlim=c(-1.0,1.0), ylim=c(0,ymax+1),xlab="vector", ylab="predictive density",main="")

 text(0.9,0.5,substitute("Y direction"))
lines(density(pred_YS4),lty=6,lwd=2, col=2)
###########################################
###########################################

###########landmark 5###############
par(fig=c(0,1,.7,1))
par(mar=c(0,5,2,2))

plot(N5[[1]]$x,N5[[1]]$y,xaxt="n", xlim=c(-1.0,1.0),
ylim=c(-1.0,1.0),type="l",lty=1,lwd=2,
xlab="X", 
ylab="Y",
main=""

)
text(.2,0.9,substitute("95 % HPD contours"))
text(.8,-0.9,substitute("horizontal axis: X"))
lines(S5[[1]]$x,S5[[1]]$y,lty=6,lwd=2,col="2")


### x ##
par(fig=c(0,1,.4,.7),new=T)
par(mar=c(0,5,0,2))
ymax=max(density(pred_XN5)$y,density(pred_XS5)$y)

plot(density(pred_XN5),lty=1,lwd=2,col=1,xaxt="n",
xlim=c(-1.0,1.0),
ylim=c(0,ymax+1), 

ylab="predictive density",main=""

)
 text(0.9,.5,substitute("X direction"))
lines(density(pred_XS5),lty=6,lwd=2, col=2)

legend("topright",c("N5","S5"),lty=c(1,6),lwd=c(2,2),col=c(1,2))

### Y #########
par(fig=c(0,1,0,0.4),new=T)
par(mar=c(5,5,0,2))
ymax=max(density(pred_YN5)$y,density(pred_YS5)$y)

plot(density(pred_YN5), lty=1,lwd=2,col=1, xlim=c(-1.0,1.0), ylim=c(0,ymax+1),xlab="vector", ylab="predictive density",main="")

 text(0.9,0.5,substitute("Y direction"))
lines(density(pred_YS5),lty=6,lwd=2, col=2)
#################################################
###############################################

###########landmark 6###############
par(fig=c(0,1,.7,1))
par(mar=c(0,5,2,2))

plot(N6[[1]]$x,N6[[1]]$y,xaxt="n", xlim=c(-1.0,1.0),
ylim=c(-1.0,1.0),type="l",lty=1,lwd=2,
xlab="X", 
ylab="Y",
main=""

)
text(.2,0.9,substitute("95 % HPD contours"))
text(.8,-0.9,substitute("horizontal axis: X"))
lines(S6[[1]]$x,S6[[1]]$y,lty=6,lwd=2,col="2")


### x ##
par(fig=c(0,1,.4,.7),new=T)
par(mar=c(0,5,0,2))
ymax=max(density(pred_XN6)$y,density(pred_XS6)$y)

plot(density(pred_XN6),lty=1,lwd=2,col=1,xaxt="n",
xlim=c(-1.0,1.0),
ylim=c(0,ymax+1), 

ylab="predictive density",main=""

)
 text(0.9,.5,substitute("X direction"))
lines(density(pred_XS6),lty=6,lwd=2, col=2)

legend("topright",c("N6","S6"),lty=c(1,6),lwd=c(2,2),col=c(1,2))

### Y #########
par(fig=c(0,1,0,0.4),new=T)
par(mar=c(5,5,0,2))
ymax=max(density(pred_YN6)$y,density(pred_YS6)$y)

plot(density(pred_YN6), lty=1,lwd=2,col=1, xlim=c(-1.0,1.0), ylim=c(0,ymax+1),xlab="vector", ylab="predictive density",main="")

 text(0.9,0.5,substitute("Y direction"))
lines(density(pred_YS6),lty=6,lwd=2, col=2)
#############################################
#############################################

###########landmark 7###############
par(fig=c(0,1,.7,1))
par(mar=c(0,5,2,2))

plot(N7[[1]]$x,N7[[1]]$y,xaxt="n", xlim=c(-1.0,1.0),
ylim=c(-1.0,1.0),type="l",lty=1,lwd=2,
xlab="X", 
ylab="Y",
main=""

)
text(.2,0.9,substitute("95 % HPD contours"))
text(.8,-0.9,substitute("horizontal axis: X"))
lines(S7[[1]]$x,S7[[1]]$y,lty=6,lwd=2,col="2")


### x ##
par(fig=c(0,1,.4,.7),new=T)
par(mar=c(0,5,0,2))
ymax=max(density(pred_XN7)$y,density(pred_XS7)$y)

plot(density(pred_XN7),lty=1,lwd=2,col=1,xaxt="n",
xlim=c(-1.0,1.0),
ylim=c(0,ymax+1), 

ylab="predictive density",main=""

)
 text(0.9,.5,substitute("X direction"))
lines(density(pred_XS7),lty=6,lwd=2, col=2)

legend("topright",c("N7","S7"),lty=c(1,6),lwd=c(2,2),col=c(1,2))

### Y #########
par(fig=c(0,1,0,0.4),new=T)
par(mar=c(5,5,0,2))
ymax=max(density(pred_YN7)$y,density(pred_YS7)$y)

plot(density(pred_YN7), lty=1,lwd=2,col=1, xlim=c(-1.0,1.0), ylim=c(0,ymax+1),xlab="vector", ylab="predictive density",main="")

 text(0.9,0.5,substitute("Y direction"))
lines(density(pred_YS7),lty=6,lwd=2, col=2)
#############################################
#############################################
###########landmark 8###############
par(fig=c(0,1,.7,1))
par(mar=c(0,5,2,2))

plot(N8[[1]]$x,N8[[1]]$y,xaxt="n", xlim=c(-1.0,1.0),
ylim=c(-1.0,1.0),type="l",lty=1,lwd=2,
xlab="X", 
ylab="Y",
main=""

)
text(.2,0.9,substitute("95 % HPD contours"))
text(.8,-0.9,substitute("horizontal axis: X"))
lines(S8[[1]]$x,S8[[1]]$y,lty=6,lwd=2,col="2")


### x ##
par(fig=c(0,1,.4,.7),new=T)
par(mar=c(0,5,0,2))
ymax=max(density(pred_XN8)$y,density(pred_XS8)$y)

plot(density(pred_XN8),lty=1,lwd=2,col=1,xaxt="n",
xlim=c(-1.0,1.0),
ylim=c(0,ymax+1), 

ylab="predictive density",main=""

)
 text(0.9,.5,substitute("X direction"))
lines(density(pred_XS8),lty=6,lwd=2, col=2)

legend("topright",c("N8","S8"),lty=c(1,6),lwd=c(2,2),col=c(1,2))

### Y #########
par(fig=c(0,1,0,0.4),new=T)
par(mar=c(5,5,0,2))
ymax=max(density(pred_YN8)$y,density(pred_YS8)$y)

plot(density(pred_YN8), lty=1,lwd=2,col=1, xlim=c(-1.0,1.0), ylim=c(0,ymax+1),xlab="vector", ylab="predictive density",main="")

 text(0.9,0.5,substitute("Y direction"))
lines(density(pred_YS8),lty=6,lwd=2, col=2)
##################################
##################################
###########landmark 9###############
par(fig=c(0,1,.7,1))
par(mar=c(0,5,2,2))

plot(N9[[1]]$x,N9[[1]]$y,xaxt="n", xlim=c(-1.0,1.0),
ylim=c(-1.0,1.0),type="l",lty=1,lwd=2,
xlab="X", 
ylab="Y",
main=""

)
text(.2,0.9,substitute("95 % HPD contours"))
text(.8,-0.9,substitute("horizontal axis: X"))
lines(S9[[1]]$x,S9[[1]]$y,lty=6,lwd=2,col="2")


### x ##
par(fig=c(0,1,.4,.7),new=T)
par(mar=c(0,5,0,2))
ymax=max(density(pred_XN9)$y,density(pred_XS9)$y)

plot(density(pred_XN9),lty=1,lwd=2,col=1,xaxt="n",
xlim=c(-1.0,1.0),
ylim=c(0,ymax+1), 

ylab="predictive density",main=""

)
 text(0.9,.5,substitute("X direction"))
lines(density(pred_XS9),lty=6,lwd=2, col=2)

legend("topright",c("N9","S9"),lty=c(1,6),lwd=c(2,2),col=c(1,2))

### Y #########
par(fig=c(0,1,0,0.4),new=T)
par(mar=c(5,5,0,2))
ymax=max(density(pred_YN9)$y,density(pred_YS9)$y)

plot(density(pred_YN9), lty=1,lwd=2,col=1, xlim=c(-1.0,1.0), ylim=c(0,ymax+1),xlab="vector", ylab="predictive density",main="")

 text(0.9,0.5,substitute("Y direction"))
lines(density(pred_YS9),lty=6,lwd=2, col=2)
##################################
##################################
###########landmark 10###############
par(fig=c(0,1,.7,1))
par(mar=c(0,5,2,2))

plot(N10[[1]]$x,N10[[1]]$y,xaxt="n", xlim=c(-1.0,1.0),
ylim=c(-1.0,1.0),type="l",lty=1,lwd=2,
xlab="X", 
ylab="Y",
main=""

)
text(.2,0.9,substitute("95 % HPD contours"))
text(.8,-0.9,substitute("horizontal axis: X"))
lines(S10[[1]]$x,S10[[1]]$y,lty=6,lwd=2,col="2")


### x ##
par(fig=c(0,1,.4,.7),new=T)
par(mar=c(0,5,0,2))
ymax=max(density(pred_XN10)$y,density(pred_XS10)$y)

plot(density(pred_XN10),lty=1,lwd=2,col=1,xaxt="n",
xlim=c(-1.0,1.0),
ylim=c(0,ymax+1), 

ylab="predictive density",main=""

)
 text(0.9,.5,substitute("X direction"))
lines(density(pred_XS10),lty=6,lwd=2, col=2)

legend("topright",c("N10","S10"),lty=c(1,6),lwd=c(2,2),col=c(1,2))

### Y #########
par(fig=c(0,1,0,0.4),new=T)
par(mar=c(5,5,0,2))
ymax=max(density(pred_YN10)$y,density(pred_YS10)$y)

plot(density(pred_YN10), lty=1,lwd=2,col=1, xlim=c(-1.0,1.0), ylim=c(0,ymax+1),xlab="vector", ylab="predictive density",main="")

 text(0.9,0.5,substitute("Y direction"))
lines(density(pred_YS10),lty=6,lwd=2, col=2)
##################################
##################################
###########landmark 11###############
par(fig=c(0,1,.7,1))
par(mar=c(0,5,2,2))

plot(N11[[1]]$x,N11[[1]]$y,xaxt="n", xlim=c(-1.0,1.0),
ylim=c(-1.0,1.0),type="l",lty=1,lwd=2,
xlab="X", 
ylab="Y",
main=""

)
text(.2,0.9,substitute("95 % HPD contours"))
text(.8,-0.9,substitute("horizontal axis: X"))
lines(S11[[1]]$x,S11[[1]]$y,lty=6,lwd=2,col="2")


### x ##
par(fig=c(0,1,.4,.7),new=T)
par(mar=c(0,5,0,2))
ymax=max(density(pred_XN11)$y,density(pred_XS11)$y)

plot(density(pred_XN11),lty=1,lwd=2,col=1,xaxt="n",
xlim=c(-1.0,1.0),
ylim=c(0,ymax+1), 

ylab="predictive density",main=""

)
 text(0.9,.5,substitute("X direction"))
lines(density(pred_XS11),lty=6,lwd=2, col=2)

legend("topright",c("N11","S11"),lty=c(1,6),lwd=c(2,2),col=c(1,2))

### Y #########
par(fig=c(0,1,0,0.4),new=T)
par(mar=c(5,5,0,2))
ymax=max(density(pred_YN11)$y,density(pred_YS11)$y)

plot(density(pred_YN11), lty=1,lwd=2,col=1, xlim=c(-1.0,1.0), ylim=c(0,ymax+1),xlab="vector", ylab="predictive density",main="")

 text(0.9,0.5,substitute("Y direction"))
lines(density(pred_YS11),lty=6,lwd=2, col=2)
##################################
##################################
###########landmark 12###############
par(fig=c(0,1,.7,1))
par(mar=c(0,5,2,2))

plot(N12[[1]]$x,N12[[1]]$y,xaxt="n", xlim=c(-1.0,1.0),
ylim=c(-1.0,1.0),type="l",lty=1,lwd=2,
xlab="X", 
ylab="Y",
main=""

)
text(.2,0.9,substitute("95 % HPD contours"))
text(.8,-0.9,substitute("horizontal axis: X"))
lines(S12[[1]]$x,S12[[1]]$y,lty=6,lwd=2,col="2")


### x ##
par(fig=c(0,1,.4,.7),new=T)
par(mar=c(0,5,0,2))
ymax=max(density(pred_XN12)$y,density(pred_XS12)$y)

plot(density(pred_XN12),lty=1,lwd=2,col=1,xaxt="n",
xlim=c(-1.0,1.0),
ylim=c(0,ymax+1), 

ylab="predictive density",main=""

)
 text(0.9,.5,substitute("X direction"))
lines(density(pred_XS12),lty=6,lwd=2, col=2)

legend("topright",c("N12","S12"),lty=c(1,6),lwd=c(2,2),col=c(1,2))

### Y #########
par(fig=c(0,1,0,0.4),new=T)
par(mar=c(5,5,0,2))
ymax=max(density(pred_YN12)$y,density(pred_YS12)$y)

plot(density(pred_YN12), lty=1,lwd=2,col=1, xlim=c(-1.0,1.0), ylim=c(0,ymax+1),xlab="vector", ylab="predictive density",main="")

 text(0.9,0.5,substitute("Y direction"))
lines(density(pred_YS12),lty=6,lwd=2, col=2)
##################################
##################################
###########landmark 13###############
par(fig=c(0,1,.7,1))
par(mar=c(0,5,2,2))

plot(N13[[1]]$x,N13[[1]]$y,xaxt="n", xlim=c(-1.0,1.0),
ylim=c(-1.0,1.0),type="l",lty=1,lwd=2,
xlab="X", 
ylab="Y",
main=""

)
text(.2,0.9,substitute("95 % HPD contours"))
text(.8,-0.9,substitute("horizontal axis: X"))
lines(S13[[1]]$x,S13[[1]]$y,lty=6,lwd=2,col="2")


### x ##
par(fig=c(0,1,.4,.7),new=T)
par(mar=c(0,5,0,2))
ymax=max(density(pred_XN13)$y,density(pred_XS13)$y)

plot(density(pred_XN13),lty=1,lwd=2,col=1,xaxt="n",
xlim=c(-1.0,1.0),
ylim=c(0,ymax+1), 

ylab="predictive density",main=""

)
 text(0.9,.5,substitute("X direction"))
lines(density(pred_XS13),lty=6,lwd=2, col=2)

legend("topright",c("N13","S13"),lty=c(1,6),lwd=c(2,2),col=c(1,2))

### Y #########
par(fig=c(0,1,0,0.4),new=T)
par(mar=c(5,5,0,2))
ymax=max(density(pred_YN13)$y,density(pred_YS13)$y)

plot(density(pred_YN13), lty=1,lwd=2,col=1, xlim=c(-1.0,1.0), ylim=c(0,ymax+1),xlab="vector", ylab="predictive density",main="")

 text(0.9,0.5,substitute("Y direction"))
lines(density(pred_YS13),lty=6,lwd=2, col=2)
##################################
##################################






dev.off()

