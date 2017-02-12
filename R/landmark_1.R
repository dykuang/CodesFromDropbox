####### Modified on June 22, 2015 #########
####### Program to obtain posterior predictive distributions for (x,y) vectors for 13 landmarks from images of brains of 14 normal and 14 schizophrenic individuals #######


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

####### following will put plots into 'countours.pdf'  #####

source("landmark_plots.R")

##### following will put marginal HPD intervals into 'landmark_HPD.txt' ###
source("HPD.R")

