###########################################################
## THIS SCRIPT RUNS THE DIFFERENT SCENARIOS OF THE MODEL,##
## AND EXPORTS THE RESULTS AS TABLES AND PLOTS           ##
###########################################################

source("Equations/PastMath_Equations.R")

# MODEL 1: agropastoral, simple

(S1 <- PastMath("Parameters/Scenario1_Parameters.R",160)) # 20 families = 160 people

# MODEL 2: agropastoral, dairy

S2 <- PastMath("Parameters/Scenario2_Parameters.R", 160) # 20 families = 160 people

# MODEL 3: dairy specialised

S3 <- PastMath("Parameters/Scenario3_Parameters.R", 160) # 20 families = 160 people

# MODEL 4: dairy specialised

S4 <- PastMath("Parameters/Scenario4_Parameters.R", 160) # 20 families = 160 people

# Combine and export the results

S<-cbind(S1,S2,S3,S4)
colnames(S)<-c("Scenario 1", "Scenario 2", "Scenario 3", "Scenario 4")

write.csv(S,file="Model_Outputs.csv")


## PLOT RESULTS

LULR <- cbind(S[1,],S[5,],S[1,]+S[3,]+S[4,]+S[5,],
      S[16,]+S[17,],
      S[18,]+S[19,]+S[20,]+S[21,],
      S[24,])
colnames(LULR) <- c("Cereal Area", "Upland Grazing", "Tot Land Use",
      "Farming Tasks", "Pastoral Tasks", "Labour Return")
rownames(LULR) <- c("Scenario 1", "Scenario 2", 
                    "Scenario 3", "Scenario 4")

LULR[,1]; LULR[,2]
LULR[,4]; LULR[,5]
LULR[,3]; LULR[,6]

# FIG. 7: Land use and task time

jpeg("Figures/Plot_A_Results_Model.jpg",width=30,height=15,units="cm",res=150)
par(mar=c(4.5,4.5,2,2))
par(mfrow=c(1,2))
plot(LULR[,1],LULR[,2],xlim=c(0,92),ylim=c(0,168),
    ylab="upland grazing area (ha)", xlab="cereal area (ha)",
    pch=20,cex=1.5)
text(LULR[,1],LULR[,2], row.names(LULR),pos=3,cex=1.2)
abline(lm(LULR[,2]~LULR[,1]),lwd=2,lty=3)
plot(LULR[,4],LULR[,5],xlim=c(0,35), ylim=c(0,60),
    ylab="pastoral tasks (days/pn)", xlab="farming tasks (days/pn)",
    pch=20,cex=1.5)
text(LULR[,4],LULR[,5], row.names(LULR),pos=3,cex=1.2)
abline(lm(LULR[,5]~LULR[,4]),lwd=2,lty=3)
dev.off()

# FIG. 8: Total land use and labour return

jpeg("Figures/Plot_B_Results_Model.jpg",width=15,height=15,units="cm",res=150)
par(mar=c(4.5,4.5,2,2))
plot(LULR[,3],LULR[,6],xlim=c(120,330),ylim=c(8,12),
    ylab="labour return (days)", xlab="total land use (ha)",
    pch=20,cex=1.5)
text(LULR[,3], LULR[,6], row.names(LULR),pos=3,cex=1.2)
abline(h=10,lwd=0.5,lty=2)
dev.off()


## SUPPLEMENTARY CODE 
# The code below is not included in the paper
# NOT RUN

# SOIL DEPLETION
# lifespan of a settlement based on crop yield decrease
# Shukurov et al. 2015

# Y_min is the minimum cereal yield

#lifespan<-function(d_f,f_m,Y,Y_min){
#  TD=(((1-f_m)/17)+f_m/28)^(-1)
#  T=(1+d_f)*((100*TD)/(100-d_f*TD))*log(Y/Y_min)
#  return(T)
#}


# Y_min: level of starvation. 1200-1800 is the minimum calories for women and men
# 600 is the limit of starvation.
# We use 60% of the daily calorie intake (1500 for adults), 
# calibrated according to age and averaged,
# below which they will change strategies or extend the cultivated area
# Y_min = ((((0.7(1.-frac_young_old)*c + frac_young_old*c_young_old))*eps_g)*day_in_year)*N/2)/(e_g*A_cereal)

#c_min<-0.6*((1.-0.5)*2500+0.5*(2500/2))
#Y_m_S1 = (((((c_min*0.66)*365)*160))/3274)/M1[1]
#Y_m_S2 = ((((c_min*0.66)*365)*160)/3274)/M2[1]
#Y_m_S3 = ((((c_min*0.51)*365)*160)/3274)/M3[1]
#Y_m_S4 = ((((c_min*0.76)*365)*160)/3274)/M4[1]

#village_life<-cbind("S1" = lifespan(1,S1[12],S1[11],Y_m_S1), 
#                    "S2" = lifespan(1,S2[12],S2[11],Y_m_S2),
#                    "S3" = lifespan(1,S3[12],S3[11],Y_m_S3), 
#                    "S4" = lifespan(1,S4[12],S4[11],Y_m_S4))

#write.csv(village_life,file="Village_Life.csv")


