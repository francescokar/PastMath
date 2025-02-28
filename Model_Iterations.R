source("PastMath_Equations.R")

# MODEL 1: agropastoral, simple

(M1 <- PastMath("Model1_Parameters.R",160)) # 20 families = 160 people

# MODEL 2: agropastoral, dairy

M2 <- PastMath("Model2_Parameters.R", 160) # 20 families = 160 people

# MODEL 3: dairy specialised

M3 <- PastMath("Model3_Parameters.R", 160) # 20 families = 160 people

# MODEL 4: dairy specialised

M4 <- PastMath("Model4_Parameters.R", 160) # 20 families = 160 people

# Combine and export the results

M<-cbind(M1,M2,M3,M4)
colnames(M)<-c("Model 1", "Model 2", "Model 3", "Model 4")

write.csv(M,file="Model_Outputs.csv")

# SOIL DEPLETION
# lifespan of a settlement based on crop yield decrease
# Shukurov et al. 2015

# Y_min is the minimum cereal yield
lifespan<-function(d_f,f_m,Y,Y_min){
  TD=(((1-f_m)/17)+f_m/28)^(-1)
  T=(1+d_f)*((100*TD)/(100-d_f*TD))*log(Y/Y_min)
  return(T)
}

# Y_min: level of starvation. 1200-1800 is the minimum calories for women and men
# 600 is the limit of starvation.
# We use 60% of the daily calorie intake (1500 for adults), 
# calibrated according to age and averaged,
# below which they will change strategies or extend the cultivated area
# Y_min = ((((0.7(1.-frac_young_old)*c + frac_young_old*c_young_old))*eps_g)*day_in_year)*N/2)/(e_g*A_cereal)



c_min<-0.6*((1.-0.5)*2500+0.5*(2500/2))
Y_m_M1 = (((((c_min*0.66)*365)*160))/3274)/M1[1]
Y_m_M2 = ((((c_min*0.66)*365)*160)/3274)/M2[1]
Y_m_M3 = ((((c_min*0.51)*365)*160)/3274)/M3[1]
Y_m_M4 = ((((c_min*0.76)*365)*160)/3274)/M4[1]



village_life<-cbind("M1" = lifespan(1,M1[12],M1[11],Y_m_M1), 
                    "M2" = lifespan(1,M2[12],M2[11],Y_m_M2),
                    "M3" = lifespan(1,M3[12],M3[11],Y_m_M3), 
                    "M4" = lifespan(1,M4[12],M4[11],Y_m_M4))

write.csv(village_life,file="Village_Life.csv")
