PastMath<-function(param,pop){
  source(param,local=T)
  
  # Number of livestock per person (hd/pn)
  n_a = eps_d*C/(k_c*a_c*m_c*e_c + k_s*a_s*m_s*e_s + k_pi*a_pi*m_pi*e_pi 
                 + kap_c*a_c*y_c*e_mc + kap_s*y_s*e_ms)
  
  # Animal energy output per person per year (kcal/pn/yr)
  E_a = n_a*(k_c*a_c*m_c*e_c + k_s*a_s*m_s*e_s + k_pi*a_pi*m_pi*e_pi)
  
  # Milk energy output per person (kcal/pn/yr)
  E_m = n_a*(kap_c*a_c*y_c*e_mc + kap_s*a_s*y_s*e_ms)
  
  # Grazing area for transhumance species per person  (ha/pn) 
  A_a_trans = n_a*(a_c*A_c + a_s*A_s) 
  
  # Grazing for non transhumance species per person (ha/pn) 
  A_a_nontr = n_a*(a_pi*A_pi)  # for animals that stay in lowland
  
  # Total grazing area per person (ha)
  A_a = A_a_nontr + A_a_trans
  
  # Fodder requirement area per person (ha/pn)
  A_p = n_a*(a_c*M_c + a_s*M_s)
  
  # Population in settlement (pn)
  N = pop
  
  # Livestock per capita (hd/pn) 
  n_c = n_a*a_c; n_s = n_a*a_s; n_pi = n_a*a_pi
  
  # Total animal population
  N_a = N*n_a
  N_c = N*n_c; N_s = N*n_s; N_pi = N*n_pi
  
  # Fraction of crop fields manured (cow and sheep manure)
  # the following assumes that manure in upland is lost
  f_m = (1. - r_mu + C*mu*eps_g*(1+delta_f)/
           ((m*n_c+d*n_s)*(1 - (delta_mid+delta_high))*e_g*Y_u*(1. - gamma - lambda)))^(-1)
  
  # Agriculture yields
  Y_m = r_mu*Y_u  # manured cereal yield (kg/ha/yr)
  Y = f_m*Y_m + (1. - f_m)*Y_u  # manured/unmanured yields (kg/ha/yr)
  Y_g = (1. - gamma - lambda)*Y  # usable yields (kg/ha/yr)
  A_g = eps_g*C/(e_g*Y_g)  # cultivated fields (ha/pn)
  A_f = A_g*(1 + delta_f)  # total arable (field) area (ha/pn)
  E_g = e_g*Y_g*A_g  # energy cereal/pulse (kcal/kg/pn)
  
  # Cereal, meat and milk consumption (kg/pn/day)
  c_cereal = eps_g*c/e_g # cereals
  c_beef = n_c*k_c*m_c/day_per_yr  # beef
  c_milk = n_c*kap_c*y_c/day_per_yr  # cattle milk
  c_capr_meat = n_s*k_s*m_s/day_per_yr  # sheep/goat
  c_capr_milk = n_s*kap_s*y_s/day_per_yr  # sheep/goat milk
  c_pork = n_pi*k_pi*m_pi/day_per_yr  # pork
  
  # Total crop areas
  A_cereal = N*A_g
  A_fallow = delta_f*A_g*N
  
  # Grazing areas
  # mid-altitude spring/autumn grazing is assumed
  # winter grazing around the village
  A_a_low = A_a_trans*(delta_low/(delta_low+delta_high+delta_mid*0.5))
  A_a_mid = A_a_trans*(0.5*delta_mid/(delta_low+delta_high+delta_mid*0.5))
  A_a_high = A_a_trans*(delta_high/(delta_low+delta_high+delta_mid*0.5))
  A_graze = N*A_a_trans # total grazing area
  A_graze_mid = N*A_a_mid  # intermediate grazing area
  A_graze_high = N*A_a_high # upland grazing area 
  A_graze_low = N*(A_a_low+A_a_nontr) # lowland grazing area
  delta_graze_low = A_graze_low/A_fallow # fraction of fallow used to graze
  
  # Meadows
  A_hm = aleph*A_p  # hay-making meadow area (ha/pn)
  A_hm_mid = A_hm*(1-frac_hm_mid)
  A_hm_low = A_hm - A_hm_mid
  A_meadow = N*A_hm
  A_meadow_mid = N*A_hm_mid
  A_meadow_low = N*A_hm_low
  delta_meadow_low = A_meadow_low/A_fallow # fraction of fallow used as meadow
  delta_meadow_mid = A_meadow_mid/A_graze_mid 
  # fraction of mid. grazing areas used as meadow
  
  
  # Farming labour
  t_plough = A_g/(s_t*workhr_per_day/m2_per_ha)
  # reaping, threshing, winnowing
  t_reap = A_g/(s_r*workhr_per_day/m2_per_ha) 
  # cutting grass
  t_cut = A_hm/(s_c*workhr_per_day/m2_per_ha)
  # convert to tot pn/day
  T_plough_tot = t_plough*N
  T_reap_tot = t_reap*N
  T_cut_tot = t_cut*N
  # convert to number of days
  T_plough = T_plough_tot/(frac_harvest*N)
  T_reap = T_reap_tot/(frac_harvest*N)
  T_cut = T_cut_tot/(frac_harvest*N)
  
  # Animal husbandry labour
  tau_shear_total = (t_shear*N_s*2/3)/workhr_per_day
  tau_shear = tau_shear_total/(frac_pastor*N)
  tau_milk_total = t_milk*(N_c*kap_c+N_s*kap_s)/workhr_per_day
  tau_milk = tau_milk_total/(frac_pastor*N)
  
  # Wool production (kg/yr)
  wool_kg = wool*N_s*2/3
  
  # dairy production (l/yr)
  milk_l = (N_c*kap_c*y_c) + (N_s*kap_s*y_s)
  cheese_kg = (1/2*milk_l)*cheese_milk
  tau_cheese_total = (t_cheese*cheese_kg)/workhr_per_day
  tau_cheese = tau_cheese_total/(frac_pastor*N)
  
  # Labour return
  # ratio of the energy produced to the energy spent on the production
  eta = day_per_yr/(T_plough+T_reap+T_cut+(1/5*tau_shear)+(1/5*tau_milk)
                        +(1/5*tau_cheese))
  
  return(rbind("1. Cereal area (ha)" = A_cereal,
               "2. Fallow (ha)" = A_fallow,
               "3. Village grazing area (ha)" = A_graze_low, 
               "4. Intermediate grazing area (ha)" = A_graze_mid, 
               "5. Upland grazing area (ha)" = A_graze_high,
               "6. Fraction of fallow area grazed" = delta_graze_low,
               "7. Lowland meadow area (ha)" = A_meadow_low,
               "8. Intermediate meadow area (ha)" = A_meadow_mid,
               "9. Fraction of fallow area for fodder" = delta_meadow_low,
               "10. Fraction of grazing area for fodder" = delta_meadow_mid,
               "11. Cereal yield (kg/ha)" = Y, "12. Fraction of field manured" = f_m,
               "13. Cattle (hd)" = N_c, "13. Sheep/Goats (hd)" = N_s, 
               "14. Pigs (hd)" = N_pi,"15. Ploughing time (days/pn)" = T_plough,
               "16. Cereal reaping time (days/pn)" = T_reap,
               "17. Grass cutting time (days/pn)" = T_cut, 
               "18. Sheep shearing time (days/pn)" = tau_shear,
               "19. Milking time (days/pn)" = tau_milk, 
               "20. Cheese making time (days/pn)" = tau_cheese, 
               "21. Wool production (kg)" = wool_kg,
               "22. Cheese production (kg)" = cheese_kg, "23. Labour return" = eta))
  
  }

