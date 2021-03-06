####### Modified on June 19, 2015 #########
####### Program to obtain posterior predictive distributions for (x,y) vectors(?) for 13 landmarks from images of brains of 14 normal and 14 schizophrenic individuals #######


## Load libraries: initially they need to be installed using install.packages() #### 
library(rjags)   ### to do the mcmc
library(coda)		## makes it easier to read output from mcmc
library(emdbook)	## one of the packages that helps with plotting contours

## columns in landmark_data.cvs are x and y for the 14 'observations'(rows),  13 landmarks and 2 groups (52 columns).

landmark_data_original<-read.csv(file="landmark_data.csv",header=T)   ### read in data ##

names(landmark_data_original)   ### check names and order of variables ####

summary(landmark_data_original)   ## summary of variables using 14 observations

attach(landmark_data_original)   ## makes variables available for use (not needed here but good to have)

landmark_data<-t(landmark_data_original)  ## transpose to make it easier for me to make an array

## dimensions of array Ypool: (2,14,2,13): 2 refers to (x,y); 14 is number of obs, 2 refers to (N,S) and 13 refers to number of landmarks ##


Ypool<-array(c(
cbind(landmark_data[1:2,],landmark_data[27:28,]),
cbind(landmark_data[3:4,],landmark_data[29:30,]),
cbind(landmark_data[5:6,],landmark_data[31:32,]),
cbind(landmark_data[7:8,],landmark_data[33:34,]),
cbind(landmark_data[9:10,],landmark_data[35:36,]),
cbind(landmark_data[11:12,],landmark_data[37:38,]),
cbind(landmark_data[13:14,],landmark_data[39:40,]),
cbind(landmark_data[15:16,],landmark_data[41:42,]),
cbind(landmark_data[17:18,],landmark_data[43:44,]),
cbind(landmark_data[19:20,],landmark_data[45:46,]),
cbind(landmark_data[21:22,],landmark_data[47:48,]),
cbind(landmark_data[23:24,],landmark_data[49:50,]),
cbind(landmark_data[25:26,],landmark_data[51:52,])
),c(2,14,2,13))


################  Parameters to be set for MCMC  #################

n.iter=10000  ## number of iterations for the MCMC algorithm
n.chains=3    ### number of independent chains to be run
n.adapt=3000   ### burn-in (ie, how many to throw out at the beginning)
# thin=3		## take every 3rd from final simulated values, so as to reduce autocorrelation 

################ running the rjags model (in the file 'hier_bvn_model.txt' and obtaining mcmc samples #####


#####################

hier_model<-jags.model("hier_bvn_model.txt", data=list("Ypool"=Ypool),
inits=list('mu'=array(rep(0,52),c(2,2,13) ) ),
n.chains=n.chains, n.adapt=n.adapt)

hier_samples<-coda.samples(hier_model,c('mu','omega','sigma','tau','rho','Ypred','a1','a2','b1','b2','mu1.mean','mu2.mean'),n.iter=n.iter,n.adapt=n.adapt)


## dic.samples(hier_model,n.iter=1000)

####################


#sink("summary_ypred.txt")			## file 'summary_ypred.txt' will contain the summar of above posteriors 									### (mu, omega, etc. )   ###

#summary(hier_samples[,1:52,drop=F])
#sink()

################### information and plots for contours (individually)
##############

par(mfrow=c(3,2))

N1<-HPDregionplot(hier_samples,vars=1:2,prob=0.95)
S1<-HPDregionplot(hier_samples,vars=3:4,prob=0.95)

N2<-HPDregionplot(hier_samples,vars=5:6,prob=0.95)
S2<-HPDregionplot(hier_samples,vars=7:8,prob=0.95)

N3<-HPDregionplot(hier_samples,vars=9:10,prob=0.95)
S3<-HPDregionplot(hier_samples,vars=11:12,prob=0.95)

N4<-HPDregionplot(hier_samples,vars=13:14,prob=0.95)
S4<-HPDregionplot(hier_samples,vars=15:16,prob=0.95)

N5<-HPDregionplot(hier_samples,vars=17:18,prob=0.95)
S5<-HPDregionplot(hier_samples,vars=19:20,prob=0.95)

N6<-HPDregionplot(hier_samples,vars=21:22,prob=0.95)
S6<-HPDregionplot(hier_samples,vars=23:24,prob=0.95)

N7<-HPDregionplot(hier_samples,vars=25:26,prob=0.95)
S7<-HPDregionplot(hier_samples,vars=27:28,prob=0.95)

N8<-HPDregionplot(hier_samples,vars=29:30,prob=0.95)
S8<-HPDregionplot(hier_samples,vars=31:32,prob=0.95)

N9<-HPDregionplot(hier_samples,vars=33:34,prob=0.95)
S9<-HPDregionplot(hier_samples,vars=35:36,prob=0.95)

N10<-HPDregionplot(hier_samples,vars=37:38,prob=0.95)
S10<-HPDregionplot(hier_samples,vars=39:40,prob=0.95)

N11<-HPDregionplot(hier_samples,vars=41:42,prob=0.95)
S11<-HPDregionplot(hier_samples,vars=43:44,prob=0.95)

N12<-HPDregionplot(hier_samples,vars=45:46,prob=0.95)
S12<-HPDregionplot(hier_samples,vars=47:48,prob=0.95)

N13<-HPDregionplot(hier_samples,vars=49:50,prob=0.95)
S13<-HPDregionplot(hier_samples,vars=51:52,prob=0.95)




#############################
### obtain the MCMC samples for further use (plots ,etc.) but only for the predictive distributions ###
## first the X data for N and S ###

pred_XN1<-unlist(hier_samples[,1,drop=F])
pred_XS1<-unlist(hier_samples[,3,drop=F])
pred_XN2<-unlist(hier_samples[,5,drop=F])
pred_XS2<-unlist(hier_samples[,7,drop=F])
pred_XN3<-unlist(hier_samples[,9,drop=F])
pred_XS3<-unlist(hier_samples[,11,drop=F])
pred_XN4<-unlist(hier_samples[,13,drop=F])
pred_XS4<-unlist(hier_samples[,15,drop=F])
pred_XN5<-unlist(hier_samples[,17,drop=F])
pred_XS5<-unlist(hier_samples[,19,drop=F])
pred_XN6<-unlist(hier_samples[,21,drop=F])
pred_XS6<-unlist(hier_samples[,23,drop=F])
pred_XN7<-unlist(hier_samples[,25,drop=F])
pred_XS7<-unlist(hier_samples[,27,drop=F])
pred_XN8<-unlist(hier_samples[,29,drop=F])
pred_XS8<-unlist(hier_samples[,31,drop=F])
pred_XN9<-unlist(hier_samples[,33,drop=F])
pred_XS9<-unlist(hier_samples[,35,drop=F])
pred_XN10<-unlist(hier_samples[,37,drop=F])
pred_XS10<-unlist(hier_samples[,39,drop=F])
pred_XN11<-unlist(hier_samples[,41,drop=F])
pred_XS11<-unlist(hier_samples[,43,drop=F])
pred_XN12<-unlist(hier_samples[,45,drop=F])
pred_XS12<-unlist(hier_samples[,47,drop=F])
pred_XN13<-unlist(hier_samples[,49,drop=F])
pred_XS13<-unlist(hier_samples[,51,drop=F])

### next the Y data for N and S ###

pred_YN1<-unlist(hier_samples[,2,drop=F])
pred_YS1<-unlist(hier_samples[,4,drop=F])
pred_YN2<-unlist(hier_samples[,6,drop=F])
pred_YS2<-unlist(hier_samples[,8,drop=F])
pred_YN3<-unlist(hier_samples[,10,drop=F])
pred_YS3<-unlist(hier_samples[,12,drop=F])
pred_YN4<-unlist(hier_samples[,14,drop=F])
pred_YS4<-unlist(hier_samples[,16,drop=F])
pred_YN5<-unlist(hier_samples[,18,drop=F])
pred_YS5<-unlist(hier_samples[,20,drop=F])
pred_YN6<-unlist(hier_samples[,22,drop=F])
pred_YS6<-unlist(hier_samples[,24,drop=F])
pred_YN7<-unlist(hier_samples[,26,drop=F])
pred_YS7<-unlist(hier_samples[,28,drop=F])
pred_YN8<-unlist(hier_samples[,30,drop=F])
pred_YS8<-unlist(hier_samples[,32,drop=F])
pred_YN9<-unlist(hier_samples[,34,drop=F])
pred_YS9<-unlist(hier_samples[,36,drop=F])
pred_YN10<-unlist(hier_samples[,38,drop=F])
pred_YS10<-unlist(hier_samples[,40,drop=F])
pred_YN11<-unlist(hier_samples[,42,drop=F])
pred_YS11<-unlist(hier_samples[,44,drop=F])
pred_YN12<-unlist(hier_samples[,46,drop=F])
pred_YS12<-unlist(hier_samples[,48,drop=F])
pred_YN13<-unlist(hier_samples[,50,drop=F])
pred_YS13<-unlist(hier_samples[,52,drop=F])



######### plots for each landmark: contours for N and S overlaid, as well as overlaid marginal 
##### distributions for X and Y ####

######## code for plots needs to be finished  ########
##################### contour + marginal plots ###############

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

