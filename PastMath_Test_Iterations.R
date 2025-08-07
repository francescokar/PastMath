########################################################
## THIS SCRIPT PERFORMS SENSITIVITY TESTS ON SELECTED ##
## MODEL PARAMETERS, AND EXPORTS THE PLOTS            ##
########################################################

source("Equations/PastMath_Test.R")

## LAND USE

## TEST CATTLE WEIGHT 1
# 100 to 550 kg of usable meat (m_c) = 50% of animal weight
# Milk yield (m_c) is fixed: 700 l (Scenario 2)
# Fodder requirement (A_c) function of animal weight:
# 2.25% of body weight, 304 days of grazing and 2000 kg of DM

m_c <- seq(100,550,0.5)

TCW1 <- lapply(m_c,function(i) 
     PastMath_Test("Parameters/Scenario2_Test.R",
     m_c=i,A_c=(2*i*0.0225*304)/2000))

## TEST CATTLE WEIGHT 2
# Usable meat (m_c) = 50% of animal weight
# Milk yield (y_c) function of animal weight: y = 2.5x
# We then remove the milk used for the calves
# Calve weight = 10% of m_c
# Calves consume 15% of their weight in milk
# Calves weaned after 90 days
# Value extracted normal distribution (sd = 25% of milk produced)
# 100 iterations, milk yelds averaged for each weight
# Fodder requirement (A_c): see above

TCW2 <- lapply(m_c,function(i) 
     PastMath_Test("Parameters/Scenario2_Test.R",
     m_c = i, 
     y_c = mean(rnorm(100,(i*2*2.5)-(i*0.1*0.15*90),i*2*2.5*0.25),
     A_c=(2*i*0.0225*304/2000))))

## TEST SHEEP/GOAT WEIGHT 1
# 10 to 55 kg usable meat (m_s) = 50% of animal weight
# Milk yield (y_s) fixed: 135 l
# Fodder requirement (A_s) function of animal weight:
# 4% of body weight, 304 days of grazing and 2000 kg of DM

m_s <- seq(10,55,0.05)

TSW1 <- lapply(m_s,function(i) 
     PastMath_Test("Parameters/Scenario2_Test.R",
     m_s = i, A_s=(2*i*0.04*304)/2000))

## TEST SHEEP/GOAT WEIGHT 2
# Usable meat (m_s) = 50% of animal weight
# Milk yield (y_s) function of animal weight: y = 3x
# We then remove the milk used for the lambs/kids
# Lamb/kid weight = 20% (newborn) to 30% of m_s
# Lambs/kids consume 10% of their weight in milk
# Lambs/kids weaned after 60 days
# Value extracted normal distribution (sd = 25% of milk produced)
# 100 iterations, milk yelds averaged for each weight
# Fodder requirement (A_s): see above


TSW2 <- lapply(m_s,function(i) 
     PastMath_Test("Parameters/Scenario2_Test.R",
     m_s = i,
     y_s = mean(rnorm(100,(i*2*3)-(i*0.3*0.1*60),i*2*3*0.25)),
     A_s=(2*i*0.04*304)/2000))

## TEST CATTLE MILK
# Milk produced (milk_c) between 200 and 2000 l 
# Same range as previous test
# Weight fixed: 200 kg of usable meat (m_c) = 400 kg
# We subtract from produced milk 270 l for calves (see Model 2)

milk_c = seq(300,2000,0.5)

TCM <- lapply(milk_c,function(i) 
     PastMath_Test("Parameters/Scenario2_Test.R",
     y_c= i-270))

## TEST SHEEP/GOAT MILK: 50-250 l production
# Milk produced (milk_s) between 50 and 250 l 
# Same range as previous test
# Weight fixed: 23 kg of usable meat (m_s) = 400 kg
# We subtract from produced milk 45 l for lambs/kids (see Model 2)

milk_s = seq(50,350,0.25)

TSM <- lapply(milk_s,function(i) 
     PastMath_Test("Parameters/Scenario2_Test.R",
     y_s = i-45))

## TEST FODDER PRODUCTIVITY
# Parameters Scenario 2
# Fodder production (A): 500-5000 kg DM
# A_c =  9 kg daily intake (2.25% of m_c) for 304 days / A
# A_s = 2.2 kg (4% of m_s) for 304 days / A

A = seq(500,5000,5)

TFP <- lapply(A,function(i) 
     PastMath_Test("Parameters/Scenario2_Test.R",
     A_c = (9*304)/i, A_s = (2.2*304)/i))


## FIG 1: Covariance of animal weight, milk production and fodder requirement

# Plot weight milk and fodder vriability

Y_C <- sapply(m_c,function(i) 
     mean(rnorm(100,(i*2*2.5)-(i*0.1*0.15*90),i*2*2.5*0.25)))
A_C <- sapply(m_c,function(i) (2*i*0.0225*304)/2000)
Y_S <- sapply(m_s, function(i) 
     mean(rnorm(100,(i*2*3)-(i*0.3*0.1*60),i*2*3*0.25)))
A_S <- sapply(m_s, function(i) (2*i*0.04*304)/2000)


jpeg("Figures/Weight_Milk_Fodder.jpg",width=33,height=15,units="cm",res=150)
par(mar=c(4.5,4.5,2,4.5))
par(mfrow=c(1,2))
plot(m_c,Y_C,xlab="cattle usable meat (kg)",ylab="cattle milk yield (l)",
     pch=1,col="grey")
par(new=T)
plot(m_c,A_C,axes=F,xlab="",ylab="",
     ylim=c(min(A_C),max(A_C)),
     type="l",lwd = 2, lty = 2)
axis(side=4)
mtext("fodder area (ha)",side=4, line=3)
plot(m_s,Y_S,xlab="sheep/goat usable meat (kg)",ylab="sheep/goat milk yield (l)",
     pch=1,col="grey")
par(new=T)
plot(m_s,A_S,axes=F,xlab="",ylab="",
     ylim=c(min(A_S),max(A_S)),
     type="l",lwd = 2, lty = 2)
axis(side=4)
mtext("fodder area (ha)",side=4, line=3)
dev.off()


## PLOT LAND USE

# Cereal area 

TCW1_CA <- sapply(TCW1,function(x) x[1,])
TCW2_CA <- sapply(TCW2,function(x) x[1,])

TSW1_CA <- sapply(TSW1, function(x) x[1,])
TSW2_CA <- sapply(TSW2, function(x) x[1,])

TCM_CA <- sapply(TCM,function(x) x[1,])
TSM_CA <- sapply(TSM, function(x) x[1,])

TFP_CA <- sapply(TFP, function(x) x[1,])

# Upland grazing area

TCW1_UG <- sapply(TCW1, function(x) x[5,])
TCW2_UG <- sapply(TCW2, function(x) x[5,])

TSW1_UG <- sapply(TSW1, function(x) x[5,])
TSW2_UG <- sapply(TSW2, function(x) x[5,])

TCM_UG <- sapply(TCM, function(x) x[5,])
TSM_UG <- sapply(TSM, function(x) x[5,])

TFP_UG <- sapply(TFP, function(x) x[5,])


# FIG 2: Correlation animal weight with cereal and upland grazing areas

summary(TCW1_CA); summary(TCW2_CA)
summary(TSW1_CA); summary(TSW2_CA)
summary(TCW1_UG); summary(TCW2_UG)
summary(TSW1_UG); summary(TSW2_UG)


jpeg("Figures/Weight_Land_Use.jpg",width=28,height=15,units="cm",res=150)
par(mar=c(4.5,4.5,4.5,2))
par(mfrow=c(1,2))
plot(m_c,TCW2_CA,xlab="cattle usable meat (kg)",ylab="cereal area (ha)",
     ylim=c(min(TCW2_CA),max(TCW2_CA)),
     pch=1)
par(new=T)
plot(m_s,TSW2_CA,axes=F,xlab="",ylab="",
     ylim=c(min(TCW2_CA),max(TCW2_CA)),
     pch=1,col="grey")
par(new=T)
plot(m_c,TCW1_CA,
     xlab="",ylab="",
     ylim=c(min(TCW2_CA),max(TCW2_CA)),
     type="l",lwd=2)
par(new=T)
plot(m_s,TSW1_CA,axes=F,
          xlab="",ylab="",ylim=c(min(TCW2_CA),max(TCW2_CA)),
          type="l",lwd=2,lty=2)     
axis(side=3)
mtext("sheep/goat usable meat (kg)",side=3, line=3)
plot(m_c,TCW2_UG,xlab="cattle usable meat (kg)",ylab="upland grazing area (ha)",
     ylim=c(min(TCW2_UG),max(TCW1_UG)),
     pch=1)
par(new=T)
plot(m_s,TSW2_UG,axes=F,xlab="",ylab="",
     ylim=c(min(TCW1_UG),max(TCW1_UG)),
     pch=1,col="grey")
par(new=T)
plot(m_c,TCW1_UG,axes=F,xlab="",ylab="",
     ylim=c(min(TCW1_UG),max(TCW1_UG)),
     type="l",lwd=2)
par(new=T)
plot(m_s,TSW1_UG,axes=F,xlab="",ylab="",
     ylim=c(min(TCW1_UG),max(TCW1_UG)),
     type="l",lwd=2,lty=2)
axis(side=3)
mtext("sheep/goat usable meat (kg)",side=3, line=3)
dev.off()

# FIG 3: Correlation milk production with cereal, upland grazing areas

summary(TCM_CA); summary(TSM_CA)
summary(TCM_UG); summary(TSM_UG)

jpeg("Figures/Milk_Land_Use.jpg",width=28,height=15,units="cm",res=150)
par(mar=c(4.5,4.5,4.5,2))
par(mfrow=c(1,2))
plot(milk_c,TCM_CA,xlab="cattle milk production (l)",ylab="cereal area (ha)",
     ylim=c(min(TCM_CA),max(TCM_CA)),
     type="l",lwd=2)
par(new=T)
plot(milk_s,TSM_CA,axes=F,
     xlab="",ylab="",
     ylim=c(min(TCM_CA),max(TCM_CA)),
     type="l",lwd=2,lty=2)
axis(side=3)
mtext("sheep/goat milk production (l)",side=3, line=3)
plot(milk_c,TCM_UG,xlab="cattle milk production (l)",ylab="upland grazing area (ha)",
     ylim=c(min(TCM_UG),max(TCM_UG)),
     type="l",lwd=2)
par(new=T)
plot(milk_s,TSM_UG,axes=F,xlab="",ylab="",
     ylim=c(min(TCM_UG),max(TCM_UG)),
     type="l",lwd=2,lty=2)
axis(side=3)
mtext("sheep/goat milk production (l)",side=3, line=3)
dev.off()

# FIG 4: Correlation fodder & milk productivity with upland grazing

summary(TCM_UG); summary(TFP_UG)

jpeg("Figures/Milk_Fodder_Grazing.jpg",width=15,height=15,units="cm",res=150)
par(mar=c(4.5,4.5,4.5,2))
plot(A,TFP_UG,xlab="fodder productivity (kg)",
     ylab="upland grazing area (ha)",
     ylim=c(min(TFP_UG),max(TFP_UG)),
     type="l",lwd=2)
par(new=T)
plot(milk_c,TCM_UG,axes=F,xlab="",ylab="",
     ylim=c(min(TFP_UG),max(TFP_UG)),
     type="l",lwd=2,lty=2)
axis(side=3)
mtext("cattle milk production (l)",side=3, line=3)
dev.off()

## LABOUR

## TEST HERDERS: Fraction of the population
# All the other parameters unchanged (Model 2)

fp <- seq(0,1,0.001)

TH <- lapply(fp,function(i) 
     PastMath_Test("Parameters/Scenario2_Test.R",
     frac_pastor=i))

## TEST CHEESE: Time for producing 1 kg of cheese
# Variability from 15 mins (0.25) to 3 hours (3.0)
# All the other parameters unchanged (Model 2)

cheese <- seq(0.25,3,0.003)

TC <- lapply(cheese,function(i)
     PastMath_Test("Parameters/Scenario2_Test.R",
     t_cheese=i))

## PLOT LABOUR

# FIG. 5: Correlation labour return with herders fraction 
# and cheese production, correlation of herders fraction with working days

TH_LR <- sapply(TH,function(x) x[24,])
TC_LR <- sapply(TC,function(x) x[24,])

TH_CT <-sapply(TH,function(x) x[21,])
TH_MT <- sapply(TH,function(x) x[20,])
TH_ST <- sapply(TH,function(x) x[19,])
TH_GT <- sapply(TH,function(x) x[18,])

jpeg("Figures/Labour.jpg",width=28,height=15,units="cm",res=150)
par(mar=c(4.5,4.5,4.5,2))
par(mfrow=c(1,2))
plot(fp,TH_LR,xlab="fraction of herders",ylab="labour return",
     ylim=c(min(TH_LR),max(TH_LR)),
     type="l",lwd=2)
par(new=T)
plot(cheese,TC_LR,axes=F,
     xlab="",ylab="",
     ylim=c(min(TH_LR),max(TH_LR)),
     type="l",lwd=2,lty=2)
axis(side=3)
mtext("time to produce 1 kg of cheese (hr)",side=3, line=3)
plot(fp,TH_CT,xlab="fraction of herders",ylab="working days per person",
     ylim=c(0,2),
     type="l",lwd=2)
par(new=T)
plot(fp,TH_MT,axes=F,
     xlab="",ylab="",
     ylim=c(0,2),
     type="l",lwd=2,lty=2)
par(new=T)
plot(fp,TH_ST,axes=F,
     xlab="",ylab="",
     ylim=c(0,2),
     type="l",lwd=2,lty=3) 
dev.off()
