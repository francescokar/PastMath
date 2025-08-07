###############################################
## PARAMETERS SENSITIVITY TESTS (SCENARIO 2) ##
###############################################

# Cereal-based, hunting still quite important
# Specialised dairy production


# CONVERSION FACTORS ####
day_per_yr = 365
m2_per_ha = 1.e4


# DIETARY REQUIREMENT ####
eps_g = 0.66  # cereal/pulse products
eps_d = 0.26  # domestic animal products
eps_f = 0.02  # wild fruits/nuts
eps_w = 0.06  # wild animal products
# reduced importance of wild fruit from 5% in Gregg 1988.
# the low calories would require an unrealistic amount of fruit/nuts
# to be gathered

# AGRICULTURE PARAMETERS ####
gamma = 0.12  # seeding fraction of the yield
lambda = 0.25 # yield fraction lost (pests, etc.)
e_g = 3000.   # energy content of crops (kcal/kg)
# according to FAO, barley energy content is 3890. kcal/kg
# according to FAO, pea energy content is 810. kcal/kg
# we estimated pulses 1/4 of cereals, consistent with some palaeobot. data
# consistent with conservative estimations in Shukurov et al. 2015
# (3890*0.75)+(810*0.25) = 3120 = decreased to 3000 to be conservative

# HERD PARAMETERS ####
a_c = 0.45   # fraction of cattle
a_s = 0.50   # fraction of ovicaprines (sheep/goat)
a_pi = 0.05  # fraction of pigs
# from zooarch. data in the region
# slightly increased % of caprines, possibly under-represented in the record

e_c = 1600.  # energy content (kcal/kg): cattle
e_s = 1600.  # energy content (kcal/kg): sheep/goat
e_pi = 3000. # energy content (kcal/kg): pigs


# DOMESTIC DAIRY PRODUCTS #####

e_mc = 600.  # energy content (kcal/l): cow milk
e_ms = 940.  # energy content (kcal/l): sheep/goat milk
# sheep milk: 1030 kcal/l, goat milk: 680 kcal/l
# with 3/1 ratio sheep/goats, the average is ~ 900

# ANIMAL HUSBANDRY ####
# for simplicity, these parameters consider adult animals only
# 2/3-month old calves/lamb/kid do not contribute significantly to the energy intake
k_c = 0.05    # fraction of cattle culled annually (/yr)
k_s = k_c    # fraction of sheep/goats culled annually (/yr)
k_pi = 0.5   # fraction of pigs culled annually (/yr)
# pigs are killed after one year
kap_c = 0.52  # fraction of milking cows in cattle herd
# 65% of herds were female, ~80% produce milk  (based on Ebersbach 2013)
kap_s = kap_c

A_pi = 0     # grazing area (ha/hd): pigs
# pigs assumed to browse in the woodland

M_c = (A_c/10)*3     # area for winter fodder (ha/hd): cattle
# same calculations for sheep/goats
# 0.3+(0.3*0.25) = 0.375, theoretical fodder surface for 1 year per caprine
# 0.375*(2/12) = ~0.06
M_s = (A_s/10)*3    # area for winder fodder (ha/hd): sheep/goat
# winter stabling is confirmed in lake dwellings in the Trentino region
aleph = 0.7  # fraction of fodder as hay
# reduced from Shukurov et al. 2015


# LABOUR PRODUCTIVITY AND CALORIE INTAKE ####
N_per_family = 8      # people per family (pn/family)
# 2 adults, 2 small children, 2 older children, 2 elders
frac_young_old = 0.5  # fraction of family requiring reduced calories

c = 2500.             # daily energy requirement p.p (kcal/pn/day)
c_young_old = c/2     # daily energy requirement p.p. young/old
c_ave = (1.-frac_young_old)*c + frac_young_old*c_young_old
C = c_ave*day_per_yr  # (average) annual energy requirement p.p. (kcal/pn/yr)

s_t = 210.            # area hand-tilled and ploughed with ard (m^2/pn-hr)
# we estimated that 20% (1/5) of the farming area was not suitable for ploughing
# using the parameters in Shukurov et al. 2015: 
# 15 m^2/person-hour tilling; 260 m^2/person-hour ploughing
# (15*0.20)+(260*0.80) = ~210
s_r = 30.             # cereal area reaped/threshed (m^2/pn-hr)
s_c = 30.             # grass area cut (m^2/pn-hr)

frac_harvest = 0.50    # fraction of people involved in reaping/cutting/harvesting
workhr_per_day = 10.  # length of working day (hr/day)
workday_per_yr = 250. # length of working year (day/yr)

t_shear = 10./60.     # time shearing per sheep (hr/hd) - 10 minutes
t_milk = 15./60.      # time milking per animal (hr/hd) - 15 minutes

# LAND USE AND SETTLEMENT EXPLOITATION AREA ####

Y_u = 700.     # unmanured cereal yields (kg/ha/yr)
# based on average barley yield for UK 1270-1470
# compatible with experimental data presented in Shukurov et al. 2015
# compatible with lower-end estimations for the Po Plain
r_mu = 1.2     # ratio of manured to unmanured yields
m = 2.5e3        # manure produced by cattle (kg/hd/yr)
# 5 tonnes a year, Shukurov et al. 2015 assumed 50% lost, we assume ~1/4
# 8 months lost in the uplands, 2 months lowland grazing, 2 months stocked
d = 5.e2       # manure produced by sheep/goats (kg/hd/yr)
# same rationale for the estimation used for cattle manure
## TO ASSESS MANURE SHEEP/GOATS!!
mu = 15.e3     # manure applied to fields (kg/ha/yr)
# currently just using cattle manure, not pig or sheep manure


# WOOLD AND CHEESE PRODUCTION PARAMETERS ####
wool = 1.5         # wool production estimate (kg/hd/yr)
# the Alpago sheep produces 2.5-3.0 kg of wool
# it has been set to 1.5 for prehistory
cheese_milk = 0.1  # kg of hard cheese produced per l of milk


# TRANSHUMANCE PARAMETERS ####
delta_mid = 2./12    # fraction of year that mid-altitude area is used
delta_high = 3./12   # fraction of year that upper-altitude area is used
delta_low = 2.5/12    # fraction of year that low-altitude grazing area is used
# half of the time around the village animals are grazed in forested areas
# not included in this estimation
frac_hm_mid = 0.4    # fodder contribution from mid altitude meadows
# fodder productivity is assumed 40% of the total (instead of 50%)
# because of elevation

