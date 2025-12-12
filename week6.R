# R course 
# week 6
# Noam Hirsch 
# 302346259

### PART 1: LOAD AND MERGE FILES ###

file_names <- dir(path = "/Users/noam/Desktop/R/stroop_data")

df = data.frame()

for(i in file_names){
  temp = read.csv(paste0("/Users/noam/Desktop/R/stroop_data/", i))
  df = rbind(df, temp)
}

length(unique(df$subject))
length(unique(df$condition))

sum(is.na(df$rt)) # 0 
# task 3: theres no na in the df so i didn't know what to do in this task #
# i either misunderstood the task or didn't use the correct code? #

hist(df$rt[df$condition == "congruent"])
hist(df$rt[df$condition == "incongruent"])

### PART 2: CLEAN DATA AND FIND OUTLIERS ###

rt_vector = c(df$rt)
abnornal_rt = function(rt_vector){
  ifelse(rt_vector > mean(rt_vector) + sd(rt_vector), TRUE, FALSE)
}

outliers_total = c()
unique_subjects = unique(df$subject)
for (i in unique_subjects){
  subject_rt = df$rt[unique_subjects == i] # 
  subject_outliers = abnornal_rt(subject_rt)
  outliers_total = c(outliers_total, subject_outliers)
}

df$outlier = outliers_total

print(df$outlier)

### PART 3: DATA DISPLAY ### 

for (i in unique_subjects){
  print(sum(df$outlier[unique_subjects == i] == TRUE))
}

clean_rt = ifelse(df$outlier == TRUE, NA, FALSE)
df$clean_rt = clean_rt
df = na.omit(df)

hist(df$rt[df$condition == "congruent"])
hist(df$rt[df$condition == "incongruent"])

