source("PastMath_Test.R")

# TEST CATTLE MEAT
# Milk calibrated: 200 to 1000 l
# FODDER based on Model 2: 2.25% daily intake, 304 days and 2000 kg of DM produced

TCW1 <- PastMath_Test("Model2_Test.R",m_c=100,y_c=200,A_c=0.7)
TCW2 <- PastMath_Test("Model2_Test.R",m_c=150,y_c=500,A_c=1.)
TCW3 <- PastMath_Test("Model2_Test.R",m_c=200,y_c=700,A_c=1.4)
TCW4 <- PastMath_Test("Model2_Test.R",m_c=250,y_c=800,A_c=1.7)
TCW5 <- PastMath_Test("Model2_Test.R",m_c=300,y_c=850,A_c=2.1)
TCW6 <- PastMath_Test("Model2_Test.R",m_c=350,y_c=900,A_c=2.4)
TCW7 <- PastMath_Test("Model2_Test.R",m_c=400,y_c=925,A_c=2.7)
TCW8 <- PastMath_Test("Model2_Test.R",m_c=450,y_c=950,A_c=3.1)
TCW9 <- PastMath_Test("Model2_Test.R",m_c=500,y_c=975,A_c=3.4)
TCW10 <- PastMath_Test("Model2_Test.R",m_c=550,y_c=1000,A_c=3.7)
TCW<-cbind(TCW1,TCW2,TCW3,TCW4,TCW5,TCW6,TCW7,TCW8,TCW9,TCW10)

# TEST SHEEP/GOAT MEAT: 32 to 64 kg
# MILK calibrated: 50 to 250 l
# FODDER based on Model 2: on 4% daily intake, 304 days and 2000 kg of DM produced

TSW1 <- PastMath_Test("Model2_Test.R",m_s=10,y_s=50,A_s=0.12)
TSW2 <- PastMath_Test("Model2_Test.R",m_s=15,y_s=80,A_s=0.18)
TSW3 <- PastMath_Test("Model2_Test.R",m_s=20,y_s=110,A_s=0.24)
TSW4 <- PastMath_Test("Model2_Test.R",m_s=25,y_s=135,A_s=0.30)
TSW5 <- PastMath_Test("Model2_Test.R",m_s=30,y_s=160,A_s=0.36)
TSW6 <- PastMath_Test("Model2_Test.R",m_s=35,y_s=185,A_s=0.43)
TSW7 <- PastMath_Test("Model2_Test.R",m_s=40,y_s=205,A_s=0.49)
TSW8 <- PastMath_Test("Model2_Test.R",m_s=45,y_s=225,A_s=0.55)
TSW9 <- PastMath_Test("Model2_Test.R",m_s=50,y_s=240,A_s=0.61)
TSW10 <- PastMath_Test("Model2_Test.R",m_s=55,y_s=250,A_s=0.67)
TSW<-cbind(TSW1,TSW2,TSW3,TSW4,TSW5,TSW6,TSW7,TSW8,TSW9,TSW10)


# TEST CATTLE MILK: 400-2200 l production (3 l for calves per day, 90 days)
# (Shukurov et al. 2015)
# weight: 400 kg (Model 2)

TCM1 <- PastMath_Test("Model2_Test.R",y_c=130)
TCM2 <- PastMath_Test("Model2_Test.R",y_c=330)
TCM3 <- PastMath_Test("Model2_Test.R",y_c=530)
TCM4 <- PastMath_Test("Model2_Test.R",y_c=730)
TCM5 <- PastMath_Test("Model2_Test.R",y_c=930)
TCM6 <- PastMath_Test("Model2_Test.R",y_c=1130)
TCM7 <- PastMath_Test("Model2_Test.R",y_c=1330)
TCM8 <- PastMath_Test("Model2_Test.R",y_c=1530)
TCM9 <- PastMath_Test("Model2_Test.R",y_c=1730)
TCM10 <- PastMath_Test("Model2_Test.R",y_c=1930)
TCM<-cbind(TCM1,TCM2,TCM3,TCM4,TCM5,TCM6,TCM7,TCM8,TCM9,TCM10)

# TEST SHEEP/GOAT MILK: 70-250 l production (0.75 l for lamb/kid per day, 60 days)
# weight: ~50 kg (Model 2)

TSM1 <- PastMath_Test("Model2_Test.R",y_s=25)
TSM2 <- PastMath_Test("Model2_Test.R",y_s=45)
TSM3 <- PastMath_Test("Model2_Test.R",y_s=65)
TSM4 <- PastMath_Test("Model2_Test.R",y_s=85)
TSM5 <- PastMath_Test("Model2_Test.R",y_s=105)
TSM6 <- PastMath_Test("Model2_Test.R",y_s=125)
TSM7 <- PastMath_Test("Model2_Test.R",y_s=145)
TSM8 <- PastMath_Test("Model2_Test.R",y_s=165)
TSM9 <- PastMath_Test("Model2_Test.R",y_s=185)
TSM10 <- PastMath_Test("Model2_Test.R",y_s=205)
TSM<-cbind(TSM1,TSM2,TSM3,TSM4,TSM5,TSM6,TSM7,TSM8,TSM9,TSM10)


# TEST CATTLE FODDER
# weight 400 kg (Model 2)
# fodder: 500-5000 kg DM:
# 2.25% daily intake, 304 days

TCF1 <- PastMath_Test("Model2_Test.R",A_c=5.5)
TCF2 <- PastMath_Test("Model2_Test.R",A_c=2.7)
TCF3 <- PastMath_Test("Model2_Test.R",A_c=1.8)
TCF4 <- PastMath_Test("Model2_Test.R",A_c=1.4)
TCF5 <- PastMath_Test("Model2_Test.R",A_c=1.1)
TCF6 <- PastMath_Test("Model2_Test.R",A_c=0.9)
TCF7 <- PastMath_Test("Model2_Test.R",A_c=0.8)
TCF8 <- PastMath_Test("Model2_Test.R",A_c=0.7)
TCF9 <- PastMath_Test("Model2_Test.R",A_c=0.6)
TCF10 <- PastMath_Test("Model2_Test.R",A_c=0.5)
TCF<-cbind(TCF1,TCF2,TCF3,TCF4,TCF5,TCF6,TCF7,TCF8,TCF9,TCF10)

# TEST SHEEP/GOAT FODDER
# weight ~50 kg (Model 2)
# fodder: 500-5000 kg DM
# 4% daily intake, 304 days

TSF1 <- PastMath_Test("Model2_Test.R",A_s=1.21)
TSF2 <- PastMath_Test("Model2_Test.R",A_s=0.60)
TSF3 <- PastMath_Test("Model2_Test.R",A_s=0.40)
TSF4 <- PastMath_Test("Model2_Test.R",A_s=0.30)
TSF5 <- PastMath_Test("Model2_Test.R",A_s=0.24)
TSF6 <- PastMath_Test("Model2_Test.R",A_s=0.20)
TSF7 <- PastMath_Test("Model2_Test.R",A_s=0.17)
TSF8 <- PastMath_Test("Model2_Test.R",A_s=0.15)
TSF9 <- PastMath_Test("Model2_Test.R",A_s=0.14)
TSF10 <- PastMath_Test("Model2_Test.R",A_s=0.12)
TSF<-cbind(TSF1,TSF2,TSF3,TSF4,TSF5,TSF6,TSF7,TSF8,TSF9,TSF10)


## PLOTS

# Cereal area

summary(TCW[1,]);summary(TCM[1,]);summary(TCF[1,])
summary(TSW[1,]);summary(TSM[1,]);summary(TSF[1,])

jpeg("Cereal_Area.jpg",width=18,height=12,units="cm",res=150)
par(mar=c(3,4.5,2,2))
plot(TCW[1,],xlab="",ylab="cereal area (ha)",xlim=c(1,10),ylim=c(53.5,54.4),
     pch=1,col="blue")
lines(TCW[1,],col="blue",lty=2)
par(new=T)
plot(TCM[1,],xlab="",ylab="",xlim=c(1,10),ylim=c(53.5,54.4),
     pch=1,col="red")
lines(TCM[1,],col="red",lty=2)
par(new=T)
plot(TSW[1,],xlab="",ylab="",xlim=c(1,10),ylim=c(53.5,54.4),
     pch=2,col="blue")
lines(TSW[1,],col="blue",lty=3)
par(new=T)
plot(TSM[1,],xlab="",ylab="",xlim=c(1,10),ylim=c(53.5,54.4),
     pch=2,col="red")
lines(TSM[1,],col="red",lty=3)
legend(7.3,53.8,legend=c("Cattle weight","Cattle milk","Caprine weight","Caprine milk"),
       col=c("blue","red","blue","red"),lty=c(2,2,3,3),pch=c(1,1,2,2))
dev.off()

## TCF and TSF have no influence on crop surface, and they have not been plotted

# Upland grazing

summary(TCW[2,]);summary(TCM[2,]);summary(TCF[2,])
summary(TSW[2,]);summary(TSM[2,]);summary(TSF[2,])

jpeg("Upland_Grazing.jpg",width=18,height=12,units="cm",res=150)
par(mar=c(3,4.5,2,2))
plot(TCW[2,],xlab="",ylab="upland grazing area (ha)",xlim=c(1,10),ylim=c(107.,108.8),
     pch=1,col="blue")
lines(TCW[2,],col="blue",lty=2)
par(new=T)
plot(TCM[2,],xlab="",ylab="",xlim=c(1,10),ylim=c(107.,108.8),
     pch=1,col="red")
lines(TCM[2,],col="red",lty=2)
par(new=T)
plot(TSW[2,],xlab="",ylab="",xlim=c(1,10),ylim=c(107.,108.8),
     pch=2,col="blue")
lines(TSW[2,],col="blue",lty=3)
par(new=T)
plot(TSM[2,],xlab="",ylab="",xlim=c(1,10),ylim=c(107.,108.8),
     pch=2,col="red")
lines(TSM[2,],col="red",lty=3)
legend(7.3,107.6,legend=c("Cattle weight","Cattle milk","Caprine weight","Caprine milk"),
       col=c("blue","red","blue","red"),lty=c(2,2,3,3),pch=c(1,1,2,2))
dev.off()

## TCF and TSF have no influence on the upland pastures, not plotted

# Fallow area for fodder

summary(TCW[9,]);summary(TCM[9,]);summary(TCF[9,])
summary(TSW[9,]);summary(TSM[9,]);summary(TSF[9,])

jpeg("Fallow_Area_Fodder.jpg",width=18,height=12,units="cm",res=150)
par(mar=c(3,4.5,2,2))
plot(TCW[9,],xlab="",ylab="fraction of fallow for fodder production",
     xlim=c(1,10),ylim=c(0.,0.4),
     pch=1,col="blue")
lines(TCW[9,],col="blue",lty=2)
par(new=T)
plot(TCM[9,],xlab="",ylab="",xlim=c(1,10),ylim=c(0.,0.4),
     pch=1,col="red")
lines(TCM[9,],col="red",lty=2)
par(new=T)
plot(TCF[9,],xlab="",ylab="",xlim=c(1,10),ylim=c(0.,0.4),
     pch=1,col="green")
lines(TCF[9,],col="green",lty=2)
par(new=T)
plot(TSW[9,],xlab="",ylab="",xlim=c(1,10),ylim=c(0.,0.4),
     pch=2,col="blue")
lines(TSW[9,],col="blue",lty=3)
par(new=T)
plot(TSM[9,],xlab="",ylab="",xlim=c(1,10),ylim=c(0.,0.4),
     pch=2,col="red")
lines(TSM[9,],col="red",lty=3)
par(new=T)
plot(TSF[9,],xlab="",ylab="",xlim=c(1,10),ylim=c(0.,0.4),
     pch=2,col="green")
lines(TSF[9,],col="green",lty=3)
legend(7.3,0.4,legend=c("Cattle weight","Cattle milk","Cattle fodder",
                         "Caprine weight","Caprine milk","Caprine fodder"),
       col=c("blue","red","green","blue","red","green"),lty=c(2,2,2,3,3,3),
       pch=c(1,1,1,2,2,2))
dev.off()


# Number of cattle

summary(TCW[13,]);summary(TCM[13,]);summary(TCF[13,])
summary(TSW[13,]);summary(TSM[13,]);summary(TSF[13,])

jpeg("Number_Cattle.jpg",width=18,height=12,units="cm",res=150)
par(mar=c(3,4.5,2,2))
plot(TCW[13,],xlab="",ylab="number of cattle",xlim=c(1,10),ylim=c(35.,135.),
     pch=1,col="blue")
lines(TCW[13,],col="blue",lty=2)
par(new=T)
plot(TCM[13,],xlab="",ylab="",xlim=c(1,10),ylim=c(35.,135.),
     pch=1,col="red")
lines(TCM[13,],col="red",lty=2)
par(new=T)
plot(TCF[13,],xlab="",ylab="",xlim=c(1,10),ylim=c(35.,135.),
     pch=1,col="green")
lines(TCF[13,],col="green",lty=2)
par(new=T)
plot(TSW[13,],xlab="",ylab="",xlim=c(1,10),ylim=c(35.,135.),
     pch=2,col="blue")
lines(TSW[13,],col="blue",lty=3)
par(new=T)
plot(TSM[13,],xlab="",ylab="",xlim=c(1,10),ylim=c(35.,135.),
     pch=2,col="red")
lines(TSM[13,],col="red",lty=3)
par(new=T)
plot(TSF[13,],xlab="",ylab="",xlim=c(1,10),ylim=c(35.,135.),
     pch=2,col="green")
lines(TSF[13,],col="green",lty=3)
legend(7.3,130,legend=c("Cattle weight","Cattle milk","Cattle fodder",
                        "Caprine weight","Caprine milk","Caprine fodder"),
       col=c("blue","red","green","blue","red","green"),lty=c(2,2,2,3,3,3),
       pch=c(1,1,1,2,2,2))
dev.off()

# Number of sheep/goats

summary(TCW[14,]);summary(TCM[14,]);summary(TCF[14,])
summary(TSW[14,]);summary(TSM[14,]);summary(TSF[14,])

jpeg("Number_Caprine.jpg",width=18,height=12,units="cm",res=150)
par(mar=c(3,4.5,2,2))
plot(TCW[14,],xlab="",ylab="number of caprines",xlim=c(1,10),ylim=c(40.,150.),
     pch=1,col="blue")
lines(TCW[14,],col="blue",lty=2)
par(new=T)
plot(TCM[14,],xlab="",ylab="",xlim=c(1,10),ylim=c(40.,150.),
     pch=1,col="red")
lines(TCM[14,],col="red",lty=2)
par(new=T)
plot(TCF[14,],xlab="",ylab="",xlim=c(1,10),ylim=c(40.,150.),
     pch=1,col="green")
lines(TCF[14,],col="green",lty=2)
par(new=T)
plot(TSW[14,],xlab="",ylab="",xlim=c(1,10),ylim=c(40.,150.),
     pch=2,col="blue")
lines(TSW[14,],col="blue",lty=3)
par(new=T)
plot(TSM[14,],xlab="",ylab="",xlim=c(1,10),ylim=c(40.,150.),
     pch=2,col="red")
lines(TSM[14,],col="red",lty=3)
par(new=T)
plot(TSF[14,],xlab="",ylab="",xlim=c(1,10),ylim=c(40.,150.),
     pch=2,col="green")
lines(TSF[14,],col="green",lty=3)
legend(7.3,145,legend=c("Cattle weight","Cattle milk","Cattle fodder",
                        "Caprine weight","Caprine milk","Caprine fodder"),
       col=c("blue","red","green","blue","red","green"),lty=c(2,2,2,3,3,3),
       pch=c(1,1,1,2,2,2))
dev.off()


## LABOUR

# FRACTION OF HERDERS: 0.1 to 1
# all the other parameters unchanged (Model 2)

TH1 <- PastMath_Test("Model2_Test.R",frac_pastor=0.1)
TH2 <- PastMath_Test("Model2_Test.R",frac_pastor=0.2)
TH3 <- PastMath_Test("Model2_Test.R",frac_pastor=0.3)
TH4 <- PastMath_Test("Model2_Test.R",frac_pastor=0.4)
TH5 <- PastMath_Test("Model2_Test.R",frac_pastor=0.5)
TH6 <- PastMath_Test("Model2_Test.R",frac_pastor=0.6)
TH7 <- PastMath_Test("Model2_Test.R",frac_pastor=0.7)
TH8 <- PastMath_Test("Model2_Test.R",frac_pastor=0.8)
TH9 <- PastMath_Test("Model2_Test.R",frac_pastor=0.9)
TH10 <- PastMath_Test("Model2_Test.R",frac_pastor=1)
TH<-cbind(TH1,TH2,TH3,TH4,TH5,TH6,TH7,TH8,TH9,TH10)

summary(TH[19,]);summary(TH[20,]);summary(TH[21,])

jpeg("Fraction_Herders.jpg",width=18,height=12,units="cm",res=150)
par(mar=c(4.5,4.5,2,2))
plot(TH[19,],ylim=c(0,10),xaxt='n',xlab="frac. of herders",
     ylab="working days per person",pch=20,col="green")
axis(1,at=seq(1,10,by=1),labels=seq(0.1,1,by=0.1))
lines(TH[19,],col="green",lty=2)
par(new=T)
plot(TH[20,],ylim=c(0,10),xaxt='n',xlab="",ylab="",pch=20,col="blue")
lines(TH[20,],col="blue",lty=2)
par(new=T)
plot(TH[21,],ylim=c(0,10),xaxt='n',xlab="",ylab="",pch=20,col="red")
lines(TH[21,],col="red",lty=2)
legend(6.5,9.5,legend=c("Shearing time","Milking time","Cheese-making time"),
       col=c("green","blue","red"),lty=c(2,2,2),
       pch=c(20,20,20))
dev.off()

jpeg("Frac_Herders_Labour.jpg",width=18,height=12,units="cm",res=150)
par(mar=c(4.5,4.5,2,2))
plot(TH[24,],ylim=c(10,14),xaxt='n',xlab="frac. of herders",
     ylab="labour return (days)",pch=20,col="red")
axis(1,at=seq(1,10,by=1),labels=seq(0.1,1,by=0.1))
lines(TH[24,],col="red",lty=2)
dev.off()

# DAIRY PRODUCTION: 0.3 to 3

TD1 <- PastMath_Test("Model2_Test.R",t_cheese=0.3)
TD2 <- PastMath_Test("Model2_Test.R",t_cheese=0.6)
TD3 <- PastMath_Test("Model2_Test.R",t_cheese=0.9)
TD4 <- PastMath_Test("Model2_Test.R",t_cheese=1.2)
TD5 <- PastMath_Test("Model2_Test.R",t_cheese=1.5)
TD6 <- PastMath_Test("Model2_Test.R",t_cheese=1.8)
TD7 <- PastMath_Test("Model2_Test.R",t_cheese=2.1)
TD8 <- PastMath_Test("Model2_Test.R",t_cheese=2.4)
TD9 <- PastMath_Test("Model2_Test.R",t_cheese=2.7)
TD10 <- PastMath_Test("Model2_Test.R",t_cheese=3.0)
TD<-cbind(TD1,TD2,TD3,TD4,TD5,TD6,TD7,TD8,TD9,TD10)

summary(TD[21,]);summary(TD[24,])

jpeg("Cheese_Prod_Labour.jpg",width=18,height=12,units="cm",res=150)
par(mar=c(4.5,4.5,2,2))
plot(TD[24,],xlim=c(1,10),ylim=c(6,13),xlab="time to produce 1 kg of cheese (hours)",
     ylab="labour return (days)",xaxt='n',pch=20,col="red")
lines(TD[24,],col="red",lty=2)
axis(1,at=seq(1,10,by=1),labels=seq(0.3,3.0,by=0.3))
dev.off()
