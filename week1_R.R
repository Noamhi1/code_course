# R course
# week 1
# Noam Hirsch
# 302346259

subject_id = c(1, 2, 3, 4, 5, 6)
gender = c("male", "female", "female", "male", "male", "male") age = c(22, 29, 33, 39, 24, 30)
depression = c(0, 1, 0, 0, 1, 1)
df = data.frame(subject_id, gender, age, depression)
write.csv(df, file = "/Users/noam/Desktop/R/R_lessons/assigment_1.csv")