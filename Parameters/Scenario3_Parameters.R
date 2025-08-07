############################
##  PARAMETERS SCENARIO 3 ##
############################

# More balanced farming and pastoralism
# Specialised dairy production


# CONVERSION FACTORS ####
day_per_yr = 365
m2_per_ha = 1.e4


# DIETARY REQUIREMENT ####
eps_g = 0.46  # cereal/pulse products
eps_d = 0.46  # domestic animal products
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

m_c = 200    # usable meat (kg/hd): cattle
# Tecchiati (p.i.): 105 cm
# Based on similar-size traditional breeds in Europe we estimated a cautionary
# weight of 350-400 kg
# 50% of meat (Shukurov et al. 2015) ~ 180
m_s = 23.    # usable meat (kg/hd): sheep/goat
# Tecchiati (p.i.): 62.5 cm, 55 kg - 50% of meat (Shukurov et al. 2015)
m_pi = 80.   # usable meat (kg/hd): pigs
# traditional alpine breed 140 kg, tentatively decreased by 15% for BA
# 70% of meat (Shukurov et al. 2015)

e_c = 1600.  # energy content (kcal/kg): cattle
e_s = 1600.  # energy content (kcal/kg): sheep/goat
e_pi = 3000. # energy content (kcal/kg): pigs


# DOMESTIC DAIRY PRODUCTS #####
y_c = 700.  # surplus cow milk (l/yr/hd) after weaning)
# calves are weaned when they are 3-4 months old
# we used the Black Anatolian Cattle = 1000 l/yr
# cows were probably heavier and more productive, we can increase to 1000 l/yr
# (which is approx. 5 times less than a current "grigia alpina")
# calves drink, ~15% of their birth weight per day
# 50% of daily production ~2 l
# 100% of daily production ~4 l
# average value of 3 l accounts for variation in milk production and requirement
# annual milk used for calves = 3 l * 3 months = 3 l * 90 days = 270
# 1000 - 270 ~ 700
# compatible with the range in Shukurov et al. 2015: 0-2000 l/yr

y_s = 135.   # surplus sheep/goat milk (l/yr/hd) after weaning
# traditional sheep breeds produce ~150 l/yr alpine goats ~280 l/yr
# lambs/kids weaned at 2 months, they drink milk for 10% of their birth weight
# birth weight 4.5 kg, with rapid increment
# 0.75 l/day * 60 days (2 months weaning) = 45 l/yr lamb/kid
# surplus for sheep = 105 l; surplus goat = 235 l
# as ratio sheep/goat is estimated 3/1, the surplus is ~ 135 l/yr

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

A_c = 1.3      # grazing area (ha/hd) 10 months cattle
# Shukurov et al. 2015 suggest 10...
# Reitmaier & Krause 2019: alpine meadow productivity 2000 kg-DM/ha
# for simplicity we used this figure for high, mid and low meadows
# Reitmaier & Krause 2019: daily intake ~2.5 kg of DM (dry matter) per 100 kg live weight
# 2.5*3.5 = 8.75
# grazing for 10 months = (365/12)*10 = ~304
# 8.75*304 = 2660 kg DM per year
# 2660/2000 = ~1.3 ha/hd
A_s = 0.3   # grazing area (ha/hd) 10 months sheep/goat
# we focus on sheep, as they represent the majority
# sheep eat 4% of their live weight per day = (55*0.04) = 2.2 kg/day
# (2.2*304)/2000 = 0.3; we increase to 0.20 to be more conservative
A_pi = 0     # grazing area (ha/hd): pigs
# pigs assumed to browse in the woodland

# modern estimations suggest 0.6 to 0.8 ha of pasture or 1.05 ha of fodder 
# for cattle for 1 year this suggests a decrease of 25% 
# in the fodder nutritive power compared  to pasture
# then 1.3+(1.3*0.25) = ~1.625 is the theoretical fodder surface for 1 year per cattle
# 1.625*(2/12) = ~0.3 is the area needed for 2 winter months
M_c = 0.3     # area for winter fodder (ha/hd): cattle
# same calculations for sheep/goats
# 0.3+(0.3*0.25) = 0.375, theoretical fodder surface for 1 year per caprine
# 0.375*(2/12) = ~0.06
M_s = 0.06    # area for winder fodder (ha/hd): sheep/goat
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

frac_harvest = 0.5    # fraction of people involved in reaping/cutting/harvesting
workhr_per_day = 10.  # length of working day (hr/day)
workday_per_yr = 250. # length of working year (day/yr)

frac_pastor = 0.1     # fraction of people involved in pastoral activities
t_shear = 10./60.     # time shearing per sheep (hr/hd) - 10 minutes
t_milk = 15./60.      # time milking per animal (hr/hd) - 15 minutes
t_cheese = 60./60.    # time for producing 1 kg of cheese - 1  hour 
# the main bottleneck here is the volume of the caldron/vessel
# which affects the amount of milk processed at any given time
# we estimate 10 l (which gives 1 kg of cheese) were processed in 1 h
# this is very labour expensive, with the available pots (we made a test)
# but if only 1/2 of the milk is used for cheese
# the rest is fermented or used for butter

# LAND USE AND SETTLEMENT EXPLOITATION AREA ####
delta_f = 2  # fallow
# from Shukurov et al. 2015

Y_u = 750.     # unmanured cereal yields (kg/ha/yr)
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
