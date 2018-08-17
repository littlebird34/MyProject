library(readxl)
dm <- read_excel("~/Desktop/DAMUS_merge_DMonly.xlsx")

data2 <- subset(dm, year >= 2553 & year <= 2555)
data1 <- subset(dm, year >= 2556)
#recode smoke
data2$dm_smoke[data2$dm_smoke==1] <- 7
data2$dm_smoke[data2$dm_smoke==2] <- 5
data2$dm_smoke[data2$dm_smoke==3] <- 6
data2$dm_smoke[data2$dm_smoke==5] <- 1
data2$dm_smoke[data2$dm_smoke==6] <- 2
data2$dm_smoke[data2$dm_smoke==7] <- 3
data1$dm_smoke[data1$dm_smoke==4] <- NA

#change type
data1 <- as.data.frame(lapply(data1, as.numeric))
data2 <- as.data.frame(lapply(data2, as.numeric))

#recode complications

data1$dm_com_cva[data1$dm_com_cva==1] <- 1
data1$dm_com_cva[data1$dm_com_cva==2] <- 1

data2$dm_com_cva[data2$dm_com_cva==1] <- 0
data2$dm_com_cva[data2$dm_com_cva==2] <- 1
data2$dm_com_cva[data2$dm_com_cva==3] <- 1

data2$dm_com_cereinfarc[data2$dm_com_cereinfarc==1] <- 0
data2$dm_com_cereinfarc[data2$dm_com_cereinfarc==2] <- 1
data2$dm_com_cereinfarc[data2$dm_com_cereinfarc==3] <- 1

data2$dm_com_ischstroke[data2$dm_com_ischstroke==1] <- 0
data2$dm_com_ischstroke[data2$dm_com_ischstroke==2] <- 1
data2$dm_com_ischstroke[data2$dm_com_ischstroke==3] <- 1

data2$dm_com_hemstroke[data2$dm_com_hemstroke==1] <- 0
data2$dm_com_hemstroke[data2$dm_com_hemstroke==2] <- 1
data2$dm_com_hemstroke[data2$dm_com_hemstroke==3] <- 1

data2$dm_com_unspstroke[data2$dm_com_unspstroke==1] <- 0
data2$dm_com_unspstroke[data2$dm_com_unspstroke==2] <- 1
data2$dm_com_unspstroke[data2$dm_com_unspstroke==3] <- 1

data2$dm_com_cerehemorhage[data2$dm_com_cerehemorhage==1] <- 0
data2$dm_com_cerehemorhage[data2$dm_com_cerehemorhage==2] <- 1
data2$dm_com_cerehemorhage[data2$dm_com_cerehemorhage==3] <- 1

data2$dm_com_tia[data2$dm_com_tia==1] <- 0
data2$dm_com_tia[data2$dm_com_tia==2] <- 1
data2$dm_com_tia[data2$dm_com_tia==3] <- 1

data2$dm_com_angipec[data2$dm_com_angipec==1] <- 0
data2$dm_com_angipec[data2$dm_com_angipec==2] <- 1
data2$dm_com_angipec[data2$dm_com_angipec==3] <- 1

data2$dm_com_chf[data2$dm_com_chf==1] <- 0
data2$dm_com_chf[data2$dm_com_chf==2] <- 1
data2$dm_com_chf[data2$dm_com_chf==3] <- 1

data2$dm_com_mi[data2$dm_com_mi==1] <- 0
data2$dm_com_mi[data2$dm_com_mi==2] <- 1
data2$dm_com_mi[data2$dm_com_mi==3] <- 1

data2$dm_com_colrevasc[data2$dm_com_colrevasc==1] <- 0
data2$dm_com_colrevasc[data2$dm_com_colrevasc==2] <- 1
data2$dm_com_colrevasc[data2$dm_com_colrevasc==3] <- 1

data2$dm_com_pad[data2$dm_com_pad==1] <- 0
data2$dm_com_pad[data2$dm_com_pad==2] <- 1
data2$dm_com_pad[data2$dm_com_pad==3] <- 1

data2$dm_af[data2$dm_af==1] <- 0
data2$dm_af[data2$dm_af==2] <- 1
data2$dm_af[data2$dm_af==3] <- 1

data2$dm_com_dr[data2$dm_com_dr==1] <- 0
data2$dm_com_dr[data2$dm_com_dr==2] <- 1
data2$dm_com_dr[data2$dm_com_dr==3] <- 1
data2$dm_com_dr[data2$dm_com_dr==5] <- 1

data1$dm_com_dr[data1$dm_com_dr==1] <- 0
data1$dm_com_dr[data1$dm_com_dr==2 & data1$year==2556] <- NA
data1$dm_com_dr[data1$dm_com_dr==3 & data1$year==2556] <- 1
data1$dm_com_dr[data1$dm_com_dr==2] <- 1

data2$dm_com_dn[data2$dm_com_dn==1] <- 0
data2$dm_com_dn[data2$dm_com_dn==2] <- 1
data2$dm_com_dn[data2$dm_com_dn==3] <- 1

data2$dm_com_reninsuf[data2$dm_com_reninsuf==1] <- 0
data2$dm_com_reninsuf[data2$dm_com_reninsuf==2] <- 1
data2$dm_com_reninsuf[data2$dm_com_reninsuf==3] <- 1

data2$dm_com_neuro[data2$dm_com_neuro==1] <- 0
data2$dm_com_neuro[data2$dm_com_neuro==2] <- 1
data2$dm_com_neuro[data2$dm_com_neuro==3] <- 1

#merge
dm_recode <- rbind.data.frame(data1,data2)

#change type of data
dm_recode$ID_new <- as.numeric(dm_recode$ID_new)
dm_recode$opd <- as.factor(dm_recode$opd)
dm_recode$dm_yr <- as.numeric(dm_recode$dm_yr)
dm_recode$dm_duration <- as.numeric(dm_recode$dm_duration)
dm_recode$pro <- as.factor(dm_recode$pro)
dm_recode$area <- as.factor(dm_recode$area)
dm_recode$region <- as.numeric(dm_recode$region)
dm_recode$region <- as.factor(dm_recode$region)
dm_recode$type_hos1 <- as.factor(dm_recode$type_hos1)

dm_recode$sex <- as.character(dm_recode$sex)
dm_recode$sex[dm_recode$sex=="1"] <- "Male"
dm_recode$sex[dm_recode$sex=="2"] <- "Female"
dm_recode$sex <- as.factor(dm_recode$sex)

#recode occupation
dm_recode$occ[dm_recode$occ==1] <- 1
dm_recode$occ[dm_recode$occ==2] <- 2
dm_recode$occ[dm_recode$occ==3] <- 2
dm_recode$occ[dm_recode$occ==4] <- 2
dm_recode$occ[dm_recode$occ==5] <- 2
dm_recode$occ[dm_recode$occ==6] <- 2
dm_recode$occ[dm_recode$occ==8] <- 2
dm_recode$occ[dm_recode$occ==9] <- 2
dm_recode$occ[dm_recode$occ==7] <- 3
dm_recode$occ[dm_recode$occ==10] <- 3
dm_recode$occ[dm_recode$occ==11] <- 3
dm_recode$occ[dm_recode$occ==12] <- 4
dm_recode$occ[dm_recode$occ==13] <- 4
dm_recode$occ <- as.factor(dm_recode$occ)

dm_recode$type <- as.factor(dm_recode$type)

dm_recode$dm_ht <- as.character(dm_recode$dm_ht)
dm_recode$dm_ht[dm_recode$dm_ht=="1"] <- "DM"
dm_recode$dm_ht[dm_recode$dm_ht=="3"] <- "DM and HT"
dm_recode$dm_ht <- as.factor(dm_recode$dm_ht)

dm_recode$waist <- as.numeric(dm_recode$waist)
dm_recode$dm_smoke <- as.factor(dm_recode$dm_smoke)
dm_recode$dm_fpg2 <- as.numeric(dm_recode$dm_fpg2)

dm_recode$dm_com_cva <- as.character(dm_recode$dm_com_cva)
dm_recode$dm_com_cva[dm_recode$dm_com_cva=="0"] <- "No"
dm_recode$dm_com_cva[dm_recode$dm_com_cva=="1"] <- "Yes"
dm_recode$dm_com_cva <- as.factor(dm_recode$dm_com_cva)

dm_recode$dm_com_cereinfarc <- as.character(dm_recode$dm_com_cereinfarc)
dm_recode$dm_com_cereinfarc[dm_recode$dm_com_cereinfarc=="0"] <- "No"
dm_recode$dm_com_cereinfarc[dm_recode$dm_com_cereinfarc=="1"] <- "Yes"
dm_recode$dm_com_cereinfarc <- as.factor(dm_recode$dm_com_cereinfarc)

dm_recode$dm_com_ischstroke <- as.character(dm_recode$dm_com_ischstroke)
dm_recode$dm_com_ischstroke[dm_recode$dm_com_ischstroke=="0"] <- "No"
dm_recode$dm_com_ischstroke[dm_recode$dm_com_ischstroke=="1"] <- "Yes"
dm_recode$dm_com_ischstroke <- as.factor(dm_recode$dm_com_ischstroke)

dm_recode$dm_com_hemstroke <- as.character(dm_recode$dm_com_hemstroke)
dm_recode$dm_com_hemstroke[dm_recode$dm_com_hemstroke=="0"] <- "No"
dm_recode$dm_com_hemstroke[dm_recode$dm_com_hemstroke=="1"] <- "Yes"
dm_recode$dm_com_hemstroke <- as.factor(dm_recode$dm_com_hemstroke)

dm_recode$dm_com_unspstroke <- as.character(dm_recode$dm_com_unspstroke)
dm_recode$dm_com_unspstroke[dm_recode$dm_com_unspstroke=="0"] <- "No"
dm_recode$dm_com_unspstroke[dm_recode$dm_com_unspstroke=="1"] <- "Yes"
dm_recode$dm_com_unspstroke <- as.factor(dm_recode$dm_com_unspstroke)

dm_recode$dm_com_cerehemorhage <- as.character(dm_recode$dm_com_cerehemorhage)
dm_recode$dm_com_cerehemorhage[dm_recode$dm_com_cerehemorhage=="0"] <- "No"
dm_recode$dm_com_cerehemorhage[dm_recode$dm_com_cerehemorhage=="1"] <- "Yes"
dm_recode$dm_com_cerehemorhage <- as.factor(dm_recode$dm_com_cerehemorhage)

dm_recode$dm_com_tia <- as.character(dm_recode$dm_com_tia)
dm_recode$dm_com_tia[dm_recode$dm_com_tia=="0"] <- "No"
dm_recode$dm_com_tia[dm_recode$dm_com_tia=="1"] <- "Yes"
dm_recode$dm_com_tia <- as.factor(dm_recode$dm_com_tia)

dm_recode$dm_com_angipec <- as.character(dm_recode$dm_com_angipec)
dm_recode$dm_com_angipec[dm_recode$dm_com_angipec=="0"] <- "No"
dm_recode$dm_com_angipec[dm_recode$dm_com_angipec=="1"] <- "Yes"
dm_recode$dm_com_angipec <- as.factor(dm_recode$dm_com_angipec)

dm_recode$dm_com_chf <- as.character(dm_recode$dm_com_chf)
dm_recode$dm_com_chf[dm_recode$dm_com_chf=="0"] <- "No"
dm_recode$dm_com_chf[dm_recode$dm_com_chf=="1"] <- "Yes"
dm_recode$dm_com_chf <- as.factor(dm_recode$dm_com_chf)

dm_recode$dm_com_mi <- as.character(dm_recode$dm_com_mi)
dm_recode$dm_com_mi[dm_recode$dm_com_mi=="0"] <- "No"
dm_recode$dm_com_mi[dm_recode$dm_com_mi=="1"] <- "Yes"
dm_recode$dm_com_mi <- as.factor(dm_recode$dm_com_mi)

dm_recode$dm_com_colrevasc <- as.character(dm_recode$dm_com_colrevasc)
dm_recode$dm_com_colrevasc[dm_recode$dm_com_colrevasc=="0"] <- "No"
dm_recode$dm_com_colrevasc[dm_recode$dm_com_colrevasc=="1"] <- "Yes"
dm_recode$dm_com_colrevasc <- as.factor(dm_recode$dm_com_colrevasc)

dm_recode$dm_com_pad <- as.character(dm_recode$dm_com_pad)
dm_recode$dm_com_pad[dm_recode$dm_com_pad=="0"] <- "No"
dm_recode$dm_com_pad[dm_recode$dm_com_pad=="1"] <- "Yes"
dm_recode$dm_com_pad <- as.factor(dm_recode$dm_com_pad)

dm_recode$dm_af <- as.character(dm_recode$dm_af)
dm_recode$dm_af[dm_recode$dm_af=="0"] <- "No"
dm_recode$dm_af[dm_recode$dm_af=="1"] <- "Yes"
dm_recode$dm_af <- as.factor(dm_recode$dm_af)

dm_recode$dm_com_dr <- as.character(dm_recode$dm_com_dr)
dm_recode$dm_com_dr[dm_recode$dm_com_dr=="0"] <- "No"
dm_recode$dm_com_dr[dm_recode$dm_com_dr=="1"] <- "Yes"
dm_recode$dm_com_dr <- as.factor(dm_recode$dm_com_dr)

dm_recode$dm_com_dn <- as.character(dm_recode$dm_com_dn)
dm_recode$dm_com_dn[dm_recode$dm_com_dn=="0"] <- "No"
dm_recode$dm_com_dn[dm_recode$dm_com_dn=="1"] <- "Yes"
dm_recode$dm_com_dn <- as.factor(dm_recode$dm_com_dn)

dm_recode$dm_com_reninsuf <- as.character(dm_recode$dm_com_reninsuf)
dm_recode$dm_com_reninsuf[dm_recode$dm_com_reninsuf=="0"] <- "No"
dm_recode$dm_com_reninsuf[dm_recode$dm_com_reninsuf=="1"] <- "Yes"
dm_recode$dm_com_reninsuf <- as.factor(dm_recode$dm_com_reninsuf)

dm_recode$dm_com_neuro <- as.character(dm_recode$dm_com_neuro)
dm_recode$dm_com_neuro[dm_recode$dm_com_neuro=="0"] <- "No"
dm_recode$dm_com_neuro[dm_recode$dm_com_neuro=="1"] <- "Yes"
dm_recode$dm_com_neuro <- as.factor(dm_recode$dm_com_neuro)

#grouping
#age
dm_recode$age_50 <- NA
dm_recode$age_50 <- as.character(dm_recode$age_50)
dm_recode$age_50[dm_recode$age < 50] <- "<50"
dm_recode$age_50[dm_recode$age >= 50] <- ">=50"
dm_recode$age_50 <- as.factor(dm_recode$age_50)

#BMI
dm_recode$BMI <- dm_recode$weight / ((dm_recode$height/100)^2)
dm_recode$BMI_gr <- NA
dm_recode$BMI_gr <- as.character(dm_recode$BMI_gr)
dm_recode$BMI_gr[dm_recode$BMI<18.5] <- "<18.5"
dm_recode$BMI_gr[dm_recode$BMI>=18.5 & dm_recode$BMI<23.0] <- "18.5-22.9"
dm_recode$BMI_gr[dm_recode$BMI>=23.0 & dm_recode$BMI<25.0] <- "23.0-24.9"
dm_recode$BMI_gr[dm_recode$BMI>=25.0 & dm_recode$BMI<30.0] <- "25.0-29.9"
dm_recode$BMI_gr[dm_recode$BMI>=30.0] <- ">=30.0"
dm_recode$BMI_gr <- as.factor(dm_recode$BMI_gr)

#waist
dm_recode$waist_gr <- NA
dm_recode$waist_gr <- as.character(dm_recode$waist_gr)
dm_recode$waist_gr[dm_recode$waist >= 90 & dm_recode$sex == "Male"] <- "Male ≥ 90, Female ≥ 80"
dm_recode$waist_gr[dm_recode$waist >= 80 & dm_recode$sex == "Female"] <- "Male ≥ 90, Female ≥ 80"
dm_recode$waist_gr[dm_recode$waist < 90 & dm_recode$sex == "Male"] <- "Male < 90, Female < 80"
dm_recode$waist_gr[dm_recode$waist < 80 & dm_recode$sex == "Female"] <- "Male < 90, Female < 80"
dm_recode$waist_gr <- as.factor(dm_recode$waist_gr)

#recode region
dm_recode$region_new <- NA
dm_recode$region_new <- as.numeric(dm_recode$region_new)
dm_recode$region_new[dm_recode$area == 1] <- 1
dm_recode$region_new[dm_recode$area == 2] <- 1
dm_recode$region_new[dm_recode$area == 3] <- 1
dm_recode$region_new[dm_recode$area == 4] <- 2
dm_recode$region_new[dm_recode$area == 5] <- 2
dm_recode$region_new[dm_recode$area == 6] <- 3
dm_recode$region_new[dm_recode$area == 7] <- 4
dm_recode$region_new[dm_recode$area == 8] <- 4
dm_recode$region_new[dm_recode$area == 9] <- 4
dm_recode$region_new[dm_recode$area == 10] <- 4
dm_recode$region_new[dm_recode$area == 11] <- 5
dm_recode$region_new[dm_recode$area == 12] <- 6
dm_recode$region_new[dm_recode$area == 13] <- 2

dm_recode$region_new <- as.factor(dm_recode$region_new)

#Descriptive
table(dm_recode$sex)
round(100*prop.table(table(dm_recode$sex)),2)

table(dm_recode$region_new)
round(100*prop.table(table(dm_recode$region_new)),2)
 
round(mean(dm_recode$age, na.rm=TRUE),2)
round(sd(dm_recode$age, na.rm=TRUE),2)
min(dm_recode$age, na.rm=TRUE)
max(dm_recode$age, na.rm=TRUE)
table(dm_recode$age_50)
round(100*prop.table(table(dm_recode$age_50)),2)

table(dm_recode$BMI_gr)
round(100*prop.table(table(dm_recode$BMI_gr)),2)

table(dm_recode$waist_gr)
round(100*prop.table(table(dm_recode$waist_gr)),2)

table(dm_recode$type)
round(100*prop.table(table(dm_recode$type)),2)

table(dm_recode$type_hos1)
round(100*prop.table(table(dm_recode$type_hos1)),2)

table(dm_recode$occ)
round(100*prop.table(table(dm_recode$occ)),2)

table(dm_recode$dm_smoke)
round(100*prop.table(table(dm_recode$dm_smoke)),2)

#subset by year
data2553 <- subset(dm_recode, year == 2553)
data2554 <- subset(dm_recode, year == 2554)
data2555 <- subset(dm_recode, year == 2555)
data2556 <- subset(dm_recode, year == 2556)
data2557 <- subset(dm_recode, year == 2557)

#mean for lipid profile
#Chol
round(mean(dm_recode$dm_tc, na.rm=TRUE),2)
round(sd(dm_recode$dm_tc, na.rm=TRUE),2)
min(dm_recode$dm_tc, na.rm=TRUE)
max(dm_recode$dm_tc, na.rm=TRUE)


round(mean(data2553$dm_tc, na.rm=TRUE),2)
round(sd(data2553$dm_tc, na.rm=TRUE),2)
min(data2553$dm_tc, na.rm=TRUE)
max(data2553$dm_tc, na.rm=TRUE)


round(mean(data2554$dm_tc, na.rm=TRUE),2)
round(sd(data2554$dm_tc, na.rm=TRUE),2)
min(data2554$dm_tc, na.rm=TRUE)
max(data2554$dm_tc, na.rm=TRUE)


round(mean(data2555$dm_tc, na.rm=TRUE),2)
round(sd(data2555$dm_tc, na.rm=TRUE),2)
min(data2555$dm_tc, na.rm=TRUE)
max(data2555$dm_tc, na.rm=TRUE)


round(mean(data2556$dm_tc, na.rm=TRUE),2)
round(sd(data2556$dm_tc, na.rm=TRUE),2)
min(data2556$dm_tc, na.rm=TRUE)
max(data2556$dm_tc, na.rm=TRUE)


round(mean(data2557$dm_tc, na.rm=TRUE),2)
round(sd(data2557$dm_tc, na.rm=TRUE),2)
min(data2557$dm_tc, na.rm=TRUE)
max(data2557$dm_tc, na.rm=TRUE)


#TG
round(mean(dm_recode$dm_tg, na.rm=TRUE),2)
round(sd(dm_recode$dm_tg, na.rm=TRUE),2)
min(dm_recode$dm_tg, na.rm=TRUE)
max(dm_recode$dm_tg, na.rm=TRUE)

round(mean(data2553$dm_tg, na.rm=TRUE),2)
round(sd(data2553$dm_tg, na.rm=TRUE),2)

round(mean(data2554$dm_tg, na.rm=TRUE),2)
round(sd(data2554$dm_tg, na.rm=TRUE),2)

round(mean(data2555$dm_tg, na.rm=TRUE),2)
round(sd(data2555$dm_tg, na.rm=TRUE),2)

round(mean(data2556$dm_tg, na.rm=TRUE),2)
round(sd(data2556$dm_tg, na.rm=TRUE),2)

round(mean(data2557$dm_tg, na.rm=TRUE),2)
round(sd(data2557$dm_tg, na.rm=TRUE),2)

#HDL
round(mean(dm_recode$dm_hdl, na.rm=TRUE),2)
round(sd(dm_recode$dm_hdl, na.rm=TRUE),2)

round(mean(data2553$dm_hdl, na.rm=TRUE),2)
round(sd(data2553$dm_hdl, na.rm=TRUE),2)

round(mean(data2554$dm_hdl, na.rm=TRUE),2)
round(sd(data2554$dm_hdl, na.rm=TRUE),2)

round(mean(data2555$dm_hdl, na.rm=TRUE),2)
round(sd(data2555$dm_hdl, na.rm=TRUE),2)

round(mean(data2556$dm_hdl, na.rm=TRUE),2)
round(sd(data2556$dm_hdl, na.rm=TRUE),2)

round(mean(data2557$dm_hdl, na.rm=TRUE),2)
round(sd(data2557$dm_hdl, na.rm=TRUE),2)

#LDL
round(mean(dm_recode$dm_ldl, na.rm=TRUE),2)
round(mean(data2553$dm_ldl, na.rm=TRUE),2)
round(mean(data2554$dm_ldl, na.rm=TRUE),2)
round(mean(data2555$dm_ldl, na.rm=TRUE),2)
round(mean(data2556$dm_ldl, na.rm=TRUE),2)
round(mean(data2557$dm_ldl, na.rm=TRUE),2)

round(sd(dm_recode$dm_ldl, na.rm=TRUE),2)
round(sd(data2553$dm_ldl, na.rm=TRUE),2)
round(sd(data2554$dm_ldl, na.rm=TRUE),2)
round(sd(data2555$dm_ldl, na.rm=TRUE),2)
round(sd(data2556$dm_ldl, na.rm=TRUE),2)
round(sd(data2557$dm_ldl, na.rm=TRUE),2)

#ptrend
library("Kendall")
tc <- c(188.62,187.80,187.44,187.56,188.59)
mk.test(tc, alternative = c("two.sided", "greater", "less"),
        continuity = TRUE)

tg <- c(177.76,	174.46,	175.04,	175.34,	175.62,	175.5)
mk.test(tg, alternative = c("two.sided", "greater", "less"),
        continuity = TRUE)

hdl <- c(46.06,	45.14,	45.82,	46.74,	47.2,	46.25)
mk.test(hdl, alternative = c("two.sided", "greater", "less"),
        continuity = TRUE)

ldl <- c(110.61,	109.33,	109.62,	108.61,	109.33,	109.45)
mk.test(ldl, alternative = c("two.sided", "greater", "less"),
        continuity = TRUE)

#Average FBS
dm_recode$fpg_avg <- NA
dm_recode$fpg_avg <- rowMeans(subset(dm_recode, select = c(dm_fpg1, dm_fpg2)), na.rm = TRUE)

#Lipid profile and FBS by group
Male <- subset(dm_recode, sex == "Male")
round(mean(Male$dm_tc, na.rm=TRUE),2)
round(mean(Male$dm_tg, na.rm=TRUE),2)
round(mean(Male$dm_hdl, na.rm=TRUE),2)
round(mean(Male$dm_ldl, na.rm=TRUE),2)

round(mean(Male$fpg_avg, na.rm=TRUE),2)
round(mean(Male$dm_hba1c, na.rm=TRUE),2)

Female <- subset(dm_recode, sex == "Female")
round(mean(Female$dm_tc, na.rm=TRUE),2)
round(mean(Female$dm_tg, na.rm=TRUE),2)
round(mean(Female$dm_hdl, na.rm=TRUE),2)
round(mean(Female$dm_ldl, na.rm=TRUE),2)

round(mean(Female$fpg_avg, na.rm=TRUE),2)
round(mean(Female$dm_hba1c, na.rm=TRUE),2)

Age_over50 <- subset(dm_recode, age_50 == ">=50")
round(mean(Age_over50$dm_tc, na.rm=TRUE),2)
round(mean(Age_over50$dm_tg, na.rm=TRUE),2)
round(mean(Age_over50$dm_hdl, na.rm=TRUE),2)
round(mean(Age_over50$dm_ldl, na.rm=TRUE),2)

round(mean(Age_over50$fpg_avg, na.rm=TRUE),2)
round(mean(Age_over50$dm_hba1c, na.rm=TRUE),2)

Age_below50 <- subset(dm_recode, age_50 == "<50")
round(mean(Age_below50$dm_tc, na.rm=TRUE),2)
round(mean(Age_below50$dm_tg, na.rm=TRUE),2)
round(mean(Age_below50$dm_hdl, na.rm=TRUE),2)
round(mean(Age_below50$dm_ldl, na.rm=TRUE),2)

round(mean(Age_below50$fpg_avg, na.rm=TRUE),2)
round(mean(Age_below50$dm_hba1c, na.rm=TRUE),2)

Obesity <- subset(dm_recode, BMI_gr == ">=30.0")
round(mean(Obesity$dm_tc, na.rm=TRUE),2)
round(mean(Obesity$dm_tg, na.rm=TRUE),2)
round(mean(Obesity$dm_hdl, na.rm=TRUE),2)
round(mean(Obesity$dm_ldl, na.rm=TRUE),2)

round(mean(Obesity$fpg_avg, na.rm=TRUE),2)
round(mean(Obesity$dm_hba1c, na.rm=TRUE),2)

Non_obesity <- subset(dm_recode, BMI_gr != ">=30.0")
round(mean(Non_obesity$dm_tc, na.rm=TRUE),2)
round(mean(Non_obesity$dm_tg, na.rm=TRUE),2)
round(mean(Non_obesity$dm_hdl, na.rm=TRUE),2)
round(mean(Non_obesity$dm_ldl, na.rm=TRUE),2)

round(mean(Non_obesity$fpg_avg, na.rm=TRUE),2)
round(mean(Non_obesity$dm_hba1c, na.rm=TRUE),2)

Truncal <- subset(dm_recode, waist_gr == "Male ≥ 90, Female ≥ 80")
round(mean(Truncal$dm_tc, na.rm=TRUE),2)
round(mean(Truncal$dm_tg, na.rm=TRUE),2)
round(mean(Truncal$dm_hdl, na.rm=TRUE),2)
round(mean(Truncal$dm_ldl, na.rm=TRUE),2)

round(mean(Truncal$fpg_avg, na.rm=TRUE),2)
round(mean(Truncal$dm_hba1c, na.rm=TRUE),2)

Non_truncal <- subset(dm_recode, waist_gr == "Male < 90, Female < 80")
round(mean(Non_truncal$dm_tc, na.rm=TRUE),2)
round(mean(Non_truncal$dm_tg, na.rm=TRUE),2)
round(mean(Non_truncal$dm_hdl, na.rm=TRUE),2)
round(mean(Non_truncal$dm_ldl, na.rm=TRUE),2)

round(mean(Non_truncal$fpg_avg, na.rm=TRUE),2)
round(mean(Non_truncal$dm_hba1c, na.rm=TRUE),2)

Smoking <- subset(dm_recode, dm_smoke == "1")
round(mean(Smoking$dm_tc, na.rm=TRUE),2)
round(mean(Smoking$dm_tg, na.rm=TRUE),2)
round(mean(Smoking$dm_hdl, na.rm=TRUE),2)
round(mean(Smoking$dm_ldl, na.rm=TRUE),2)

round(mean(Smoking$fpg_avg, na.rm=TRUE),2)
round(mean(Smoking$dm_hba1c, na.rm=TRUE),2)

Exsmoke <- subset(dm_recode, dm_smoke == "2")
round(mean(Exsmoke$dm_tc, na.rm=TRUE),2)
round(mean(Exsmoke$dm_tg, na.rm=TRUE),2)
round(mean(Exsmoke$dm_hdl, na.rm=TRUE),2)
round(mean(Exsmoke$dm_ldl, na.rm=TRUE),2)

round(mean(Exsmoke$fpg_avg, na.rm=TRUE),2)
round(mean(Exsmoke$dm_hba1c, na.rm=TRUE),2)

Nonsmoke <- subset(dm_recode, dm_smoke == "3")
round(mean(Nonsmoke$dm_tc, na.rm=TRUE),2)
round(mean(Nonsmoke$dm_tg, na.rm=TRUE),2)
round(mean(Nonsmoke$dm_hdl, na.rm=TRUE),2)
round(mean(Nonsmoke$dm_ldl, na.rm=TRUE),2)

round(mean(Nonsmoke$fpg_avg, na.rm=TRUE),2)
round(mean(Nonsmoke$dm_hba1c, na.rm=TRUE),2)

#Abnormal lipid
dm_recode$tc_gr <- NA
dm_recode$tc_gr <- as.numeric(dm_recode$tc_gr)
dm_recode$tc_gr <- dm_recode$dm_tc
dm_recode$tc_gr[dm_recode$tc_gr < 200] <- 0 #normal
dm_recode$tc_gr[dm_recode$tc_gr >= 200] <- 1 #abnormal
#dm_recode$tc_gr <- as.factor(dm_recode$tc_gr)

dm_recode$tg_gr <- NA
dm_recode$tg_gr <- as.numeric(dm_recode$tg_gr)
dm_recode$tg_gr <- dm_recode$dm_tg
dm_recode$tg_gr[dm_recode$tg_gr < 150] <- 0 #normal
dm_recode$tg_gr[dm_recode$tg_gr >= 150] <- 1 #abnormal
#dm_recode$tg_gr <- as.factor(dm_recode$tg_gr)

dm_recode$ldl_gr <- NA
dm_recode$ldl_gr <- as.numeric(dm_recode$ldl_gr)
dm_recode$ldl_gr <- dm_recode$dm_ldl
dm_recode$ldl_gr[dm_recode$ldl_gr < 100] <- 0 #normal
dm_recode$ldl_gr[dm_recode$ldl_gr >= 100] <- 1 #abnormal
#dm_recode$ldl_gr <- as.factor(dm_recode$ldl_gr)

dm_recode$hdl_gr <- NA
dm_recode$hdl_gr <- as.numeric(dm_recode$hdl_gr)
dm_recode$hdl_gr <- dm_recode$dm_hdl
dm_recode$hdl_gr[dm_recode$hdl_gr <= 40 & dm_recode$sex == "Male"] <- 1 #abnormal
dm_recode$hdl_gr[dm_recode$hdl_gr > 40 & dm_recode$sex == "Male"] <- 0 #normal
dm_recode$hdl_gr[dm_recode$hdl_gr <= 50 & dm_recode$sex == "Female"] <- 1 #abnormal
dm_recode$hdl_gr[dm_recode$hdl_gr > 50 & dm_recode$sex == "Female"] <- 0 #normal

dm_recode$hdl_gr[dm_recode$hdl_gr > 1] <- NA
#dm_recode$hdl_gr <- as.factor(dm_recode$hdl_gr)

table(dm_recode$tc_gr)
round(100*prop.table(table(dm_recode$tc_gr)),2)

table(dm_recode$tg_gr)
round(100*prop.table(table(dm_recode$tg_gr)),2)

table(dm_recode$ldl_gr)
round(100*prop.table(table(dm_recode$ldl_gr)),2)

table(dm_recode$hdl_gr)
round(100*prop.table(table(dm_recode$hdl_gr)),2)

dm_recode$mixed_tctg <- (dm_recode$tc_gr == 1 & dm_recode$tg_gr == 1)
dm_recode$mixed_tctg <- as.numeric(dm_recode$mixed_tctg)

table(dm_recode$mixed_tctg)
round(100*prop.table(table(dm_recode$mixed_tctg)),2)

#Non-HDL

dm_recode$non_hdl2 <- dm_recode$dm_tc - dm_recode$dm_hdl
dm_recode$non_hdl <- dm_recode$dm_tc - dm_recode$dm_hdl
dm_recode$non_hdl[dm_recode$non_hdl - dm_recode$dm_ldl < 30] <- 1 #abnormal
dm_recode$non_hdl[dm_recode$non_hdl - dm_recode$dm_ldl >= 30] <- 0 #normal
dm_recode$non_hdl[dm_recode$non_hdl != 1 & dm_recode$non_hdl != 0] <- NA

table(dm_recode$non_hdl)
round(100*prop.table(table(dm_recode$non_hdl)),2)

#Dyslipidemia
dm_recode$dlp <- dm_recode$tc_gr + dm_recode$tg_gr + dm_recode$ldl_gr + dm_recode$hdl_gr
dm_recode$dlp[dm_recode$dlp >= 1] <- 1 #abnormal
dm_recode$dlp <- as.factor(dm_recode$dlp)

table(dm_recode$dlp)
round(100*prop.table(table(dm_recode$dlp)),2)

table(dm_recode$dlp, dm_recode$sex)

table(dm_recode$dlp, dm_recode$region_new)

table(dm_recode$dlp, dm_recode$age_50)

table(dm_recode$dlp, dm_recode$BMI_gr)

table(dm_recode$dlp, dm_recode$waist_gr)

table(dm_recode$dlp, dm_recode$type)

table(dm_recode$dlp, dm_recode$type_hos1)

table(dm_recode$dlp, dm_recode$occ)

table(dm_recode$dlp, dm_recode$dm_smoke)

#Fit model
fit1 <- lm(fpg_avg ~ dm_tc + dm_tg + dm_hdl + dm_ldl, data = dm_recode)
summary(fit1)
round(exp(cbind(OR=coef(fit1), confint(fit1))),2)

fit2 <- lm(fpg_avg ~ dm_tc, data = dm_recode)
summary(fit2)
round(exp(cbind(OR=coef(fit2), confint(fit2))),2)

fit3 <- lm(fpg_avg ~ dm_tg, data = dm_recode)
summary(fit3)
round(exp(cbind(OR=coef(fit3), confint(fit3))),2)

fit4 <- lm(fpg_avg ~ dm_hdl, data = dm_recode)
summary(fit4)
round(exp(cbind(OR=coef(fit4), confint(fit4))),2)

fit5 <- lm(fpg_avg ~ dm_ldl, data = dm_recode)
summary(fit5)
round(exp(cbind(OR=coef(fit5), confint(fit5))),2)

fit6 <- lm(fpg_avg ~ non_hdl2, data = dm_recode)
summary(fit6)
round(exp(cbind(OR=coef(fit6), confint(fit6))),2)

install.packages("dplyr")
library("dplyr")
tc_data <- select(dm_recode, fpg_avg,dm_tc)
tc_data <- na.omit(tc_data)
summary(tc_data$fpg_avg)
sd(tc_data$fpg_avg)

tg_data <- select(dm_recode, fpg_avg,dm_tg)
tg_data <- na.omit(tg_data)
summary(tg_data$fpg_avg)
sd(tg_data$fpg_avg)

hdl_data <- select(dm_recode, fpg_avg,dm_hdl)
hdl_data <- na.omit(hdl_data)
summary(hdl_data$fpg_avg)
sd(hdl_data$fpg_avg)

ldl_data <- select(dm_recode, fpg_avg,dm_ldl)
ldl_data <- na.omit(ldl_data)
summary(ldl_data$fpg_avg)
sd(ldl_data$fpg_avg)

nonhdl_data <- select(dm_recode, non_hdl2, fpg_avg)
nonhdl_data <- na.omit(nonhdl_data)
summary(nonhdl_data$fpg_avg)
sd(nonhdl_data$fpg_avg)

#logistic (univariate)
dm_recode$sex <- factor(dm_recode$sex, levels = c("Male", "Female") )

logit1 <- glm(dlp ~ sex, family = binomial(link = 'logit'), data = dm_recode)
summary(logit1)
round(exp(cbind(OR=coef(logit1), confint(logit1))),2)

logit2 <- glm(dlp ~ region_new, family = binomial(link = 'logit'), data = dm_recode)
summary(logit2)
round(exp(cbind(OR=coef(logit2), confint(logit2))),2)

logit3.1 <- glm(dlp ~ age, family = binomial(link = 'logit'), data = dm_recode)
summary(logit3.1)
round(exp(cbind(OR=coef(logit3.1), confint(logit3.1))),2)

dm_recode$age_50 <- factor(dm_recode$age_50, levels = c(">=50", "<50") )

logit3.2 <- glm(dlp ~ age_50, family = binomial(link = 'logit'), data = dm_recode)
summary(logit3.2)
round(exp(cbind(OR=coef(logit3.2), confint(logit3.2))),2)

logit4 <- glm(dlp ~ BMI_gr, family = binomial(link = 'logit'), data = dm_recode)
summary(logit4)
round(exp(cbind(OR=coef(logit4), confint(logit4))),2)

logit5 <- glm(dlp ~ waist_gr, family = binomial(link = 'logit'), data = dm_recode)
summary(logit5)
round(exp(cbind(OR=coef(logit5), confint(logit5))),2)

logit6 <- glm(dlp ~ type, family = binomial(link = 'logit'), data = dm_recode)
summary(logit6)
round(exp(cbind(OR=coef(logit6), confint(logit6))),2)

logit7 <- glm(dlp ~ type_hos1, family = binomial(link = 'logit'), data = dm_recode)
summary(logit7)
round(exp(cbind(OR=coef(logit7), confint(logit7))),2)

logit8 <- glm(dlp ~ occ, family = binomial(link = 'logit'), data = dm_recode)
summary(logit8)
round(exp(cbind(OR=coef(logit8), confint(logit8))),2)


dm_recode$dm_smoke <- as.numeric(dm_recode$dm_smoke)
dm_recode$dm_smoke[dm_recode$dm_smoke == 1] <- 6 #current 
dm_recode$dm_smoke[dm_recode$dm_smoke == 3] <- 1 #non
dm_recode$dm_smoke[dm_recode$dm_smoke == 6] <- 3 #current
dm_recode$dm_smoke <- as.factor(dm_recode$dm_smoke)

logit9 <- glm(dlp ~ dm_smoke, family = binomial(link = 'logit'), data = dm_recode)
summary(logit9)
round(exp(cbind(OR=coef(logit9), confint(logit9))),2)

##COMPLICATIONS
table(dm_recode$dm_com_cva,dm_recode$dlp)
table(dm_recode$dm_com_cereinfarc,dm_recode$dlp)
table(dm_recode$dm_com_ischstroke,dm_recode$dlp)
table(dm_recode$dm_com_hemstroke,dm_recode$dlp)
table(dm_recode$dm_com_unspstroke,dm_recode$dlp)
table(dm_recode$dm_com_cerehemorhage,dm_recode$dlp)
table(dm_recode$dm_com_tia,dm_recode$dlp)
table(dm_recode$dm_com_angipec,dm_recode$dlp)
table(dm_recode$dm_com_chf,dm_recode$dlp)
table(dm_recode$dm_com_mi,dm_recode$dlp)
table(dm_recode$dm_com_colrevasc,dm_recode$dlp)
table(dm_recode$dm_com_pad,dm_recode$dlp)
table(dm_recode$dm_af,dm_recode$dlp)
table(dm_recode$dm_com_dr,dm_recode$dlp)
table(dm_recode$dm_com_dn,dm_recode$dlp)
table(dm_recode$dm_com_reninsuf,dm_recode$dlp)
table(dm_recode$dm_com_neuro,dm_recode$dlp)

logit10 <- glm(dlp ~ dm_com_cva, family = binomial(link = 'logit'), data = dm_recode)
summary(logit10)
round(exp(cbind(OR=coef(logit10), confint(logit10))),2)

logit11 <- glm(dlp ~ dm_com_cereinfarc, family = binomial(link = 'logit'), data = dm_recode)
summary(logit11)
round(exp(cbind(OR=coef(logit11), confint(logit11))),2)

logit12 <- glm(dlp ~ dm_com_ischstroke, family = binomial(link = 'logit'), data = dm_recode)
summary(logit12)
round(exp(cbind(OR=coef(logit12), confint(logit12))),2)

logit13 <- glm(dlp ~ dm_com_hemstroke, family = binomial(link = 'logit'), data = dm_recode)
summary(logit13)
round(exp(cbind(OR=coef(logit13), confint(logit13))),2)

logit14 <- glm(dlp ~ dm_com_unspstroke, family = binomial(link = 'logit'), data = dm_recode)
summary(logit14)
round(exp(cbind(OR=coef(logit14), confint(logit14))),2)

logit15 <- glm(dlp ~ dm_com_cerehemorhage, family = binomial(link = 'logit'), data = dm_recode)
summary(logit15)
round(exp(cbind(OR=coef(logit15), confint(logit15))),2)

logit16 <- glm(dlp ~ dm_com_tia, family = binomial(link = 'logit'), data = dm_recode)
summary(logit16)
round(exp(cbind(OR=coef(logit16), confint(logit16))),2)

logit17 <- glm(dlp ~ dm_com_angipec, family = binomial(link = 'logit'), data = dm_recode)
summary(logit17)
round(exp(cbind(OR=coef(logit17), confint(logit17))),2)

logit18 <- glm(dlp ~ dm_com_chf, family = binomial(link = 'logit'), data = dm_recode)
summary(logit18)
round(exp(cbind(OR=coef(logit18), confint(logit18))),2)

logit19 <- glm(dlp ~ dm_com_mi, family = binomial(link = 'logit'), data = dm_recode)
summary(logit19)
round(exp(cbind(OR=coef(logit19), confint(logit19))),2)

logit20 <- glm(dlp ~ dm_com_colrevasc, family = binomial(link = 'logit'), data = dm_recode)
summary(logit20)
round(exp(cbind(OR=coef(logit20), confint(logit20))),2)

logit21 <- glm(dlp ~ dm_com_pad, family = binomial(link = 'logit'), data = dm_recode)
summary(logit21)
round(exp(cbind(OR=coef(logit21), confint(logit21))),2)

logit22 <- glm(dlp ~ dm_af, family = binomial(link = 'logit'), data = dm_recode)
summary(logit22)
round(exp(cbind(OR=coef(logit22), confint(logit22))),2)

logit23 <- glm(dlp ~ dm_com_dr, family = binomial(link = 'logit'), data = dm_recode)
summary(logit23)
round(exp(cbind(OR=coef(logit23), confint(logit23))),2)

logit24 <- glm(dlp ~ dm_com_dn, family = binomial(link = 'logit'), data = dm_recode)
summary(logit24)
round(exp(cbind(OR=coef(logit24), confint(logit24))),2)

logit25 <- glm(dlp ~ dm_com_reninsuf, family = binomial(link = 'logit'), data = dm_recode)
summary(logit25)
round(exp(cbind(OR=coef(logit25), confint(logit25))),2)

logit26 <- glm(dlp ~ dm_com_neuro, family = binomial(link = 'logit'), data = dm_recode)
summary(logit26)
round(exp(cbind(OR=coef(logit26), confint(logit26))),2)

#Clean NA
library(dplyr)
dm_fit <- select(dm_recode,ID_new,sex,region_new,age,weight,height,waist,
                 type,type_hos1,occ,dm_smoke,dm_com_cva,dm_com_cereinfarc,dm_com_hemstroke,
                 dm_com_unspstroke,dm_com_mi,dm_com_colrevasc,dm_com_dn,dm_com_reninsuf,dm_com_neuro,dlp)
dm_fit$age[is.na(dm_fit$age)] <- mean(dm_fit$age,na.rm=T)
dm_fit$weight[is.na(dm_fit$weight)] <- mean(dm_fit$weight,na.rm=T)
dm_fit$height[is.na(dm_fit$height)] <- mean(dm_fit$height,na.rm=T)
dm_fit$waist[is.na(dm_fit$waist)] <- mean(dm_fit$waist,na.rm=T)

#age
dm_fit$age_50 <- NA
dm_fit$age_50 <- as.character(dm_fit$age_50)
dm_fit$age_50[dm_fit$age < 50] <- "<50"
dm_fit$age_50[dm_fit$age >= 50] <- ">=50"
dm_fit$age_50 <- as.factor(dm_fit$age_50)

#BMI
dm_fit$BMI <- dm_fit$weight / ((dm_fit$height/100)^2)
dm_fit$BMI_gr <- NA
dm_fit$BMI_gr <- as.character(dm_fit$BMI_gr)
dm_fit$BMI_gr[dm_fit$BMI<18.5] <- "<18.5"
dm_fit$BMI_gr[dm_fit$BMI>=18.5 & dm_fit$BMI<23.0] <- "18.5-22.9"
dm_fit$BMI_gr[dm_fit$BMI>=23.0 & dm_fit$BMI<25.0] <- "23.0-24.9"
dm_fit$BMI_gr[dm_fit$BMI>=25.0 & dm_fit$BMI<30.0] <- "25.0-29.9"
dm_fit$BMI_gr[dm_fit$BMI>=30.0] <- ">=30.0"
dm_fit$BMI_gr <- as.factor(dm_fit$BMI_gr)

#waist
dm_fit$waist_gr <- NA
dm_fit$waist_gr <- as.character(dm_fit$waist_gr)
dm_fit$waist_gr[dm_fit$waist >= 90 & dm_fit$sex == "Male"] <- "Male ≥ 90, Female ≥ 80"
dm_fit$waist_gr[dm_fit$waist >= 80 & dm_fit$sex == "Female"] <- "Male ≥ 90, Female ≥ 80"
dm_fit$waist_gr[dm_fit$waist < 90 & dm_fit$sex == "Male"] <- "Male < 90, Female < 80"
dm_fit$waist_gr[dm_fit$waist < 80 & dm_fit$sex == "Female"] <- "Male < 90, Female < 80"
dm_fit$waist_gr <- as.factor(dm_fit$waist_gr)

colSums(is.na(dm_fit))

##MICE
library(mice)
init = mice(dm_fit, maxit = 0)
meth = init$method
predM = init$predictorMatrix

predM[,c("dlp")]=0
meth[c("ID_new","age","weight","height","waist","age_50","BMI","BMI_gr","waist_gr","region_new")]=""
meth[c("sex","dm_com_cva","dm_com_cereinfarc","dm_com_hemstroke","dm_com_unspstroke",
         "dm_com_mi","dm_com_colrevasc","dm_com_dn","dm_com_reninsuf","dm_com_neuro")]="logreg"
meth[c("type","type_hos1","occ","dm_smoke")]="polyreg"

set.seed(123)
imputed_data <- mice(dm_fit, method = meth, predictorMatrix = predM, m=5)
complete_data <- complete(imputed_data)

sapply(complete_data, function(x) sum(is.na(x)))

complete_data$waist_gr[complete_data$waist >= 90 & complete_data$sex == "Male"] <- "Male ≥ 90, Female ≥ 80"
complete_data$waist_gr[complete_data$waist >= 80 & complete_data$sex == "Female"] <- "Male ≥ 90, Female ≥ 80"
complete_data$waist_gr[complete_data$waist < 90 & complete_data$sex == "Male"] <- "Male < 90, Female < 80"
complete_data$waist_gr[complete_data$waist < 80 & complete_data$sex == "Female"] <- "Male < 90, Female < 80"


#MULTIPLE LOGIT
complete_data$sex <- factor(complete_data$sex, levels = c("Male", "Female") )
complete_data$age_50 <- factor(complete_data$age_50, levels = c(">=50", "<50") )


fit_null <- glm(dlp ~ 1,family = binomial(), data = complete_data)
summary(fit_null)

fit_full <- glm(dlp ~ sex + region_new+age_50+BMI_gr+waist_gr+type+type_hos1+occ+
                  dm_smoke+dm_com_cva+dm_com_cereinfarc+dm_com_hemstroke+dm_com_unspstroke+
                  dm_com_mi+dm_com_colrevasc+dm_com_dn+dm_com_reninsuf+dm_com_neuro,
                family = binomial(), data = complete_data)
summary(fit_full)

fit.step <- step(fit_null, scope=list(lower=fit_null, upper=fit_full), direction= "both")
#Step:  AIC=94429.89

#FINAL
fit_full2 <- glm(dlp ~ sex + region_new + type + BMI_gr + type_hos1 + occ + dm_com_unspstroke + 
                   waist_gr + age_50 + dm_smoke + dm_com_reninsuf + dm_com_colrevasc + 
                   dm_com_dn + dm_com_cereinfarc,family = binomial(), data = complete_data)
summary(fit_full2)
round(exp(cbind(OR=coef(fit_full2), confint(fit_full2))),2)




fit_full3 <- glm(dlp ~ sex + region_new + type + BMI_gr + type_hos1 + occ + dm_com_cva + 
                   waist_gr + age_50 + dm_smoke + dm_com_reninsuf + dm_com_colrevasc + 
                   dm_com_dn + dm_com_cereinfarc + dm_com_neuro
                 ,family = binomial(), data = complete_data)
summary(fit_full3)
