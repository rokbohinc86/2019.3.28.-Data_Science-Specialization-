all <- lm(Fertility ~ ., data = swiss)
summary(all)
cor(swiss$Examination, swiss$Education)
cor(swiss)