pm0
cnames <- strsplit(cnames, "|", fixed = TRUE)
names(pm0) <- make.names(cnames[[1]][wcol])
x0 <- pm0$Sample.Value
mean(is.na(x0)) # 10 percent missing values

# The same with pm1
boxplot(x0,x1)
boxplot(log10(x0),log10(x1))

negative <- x1<0
dates <- as.Date(as.character(dates), "%Y%m%d")
hist(dates[negative], "month") # measured in winter months where the value is low, so we assighn the negative values to errors

both <- intersect(site0, site1)

cnt1 <- subset(pm1, State.Code == 36 & county.site %in% both)
cnt1 <- subset(pm1, State.Code == 36 & county.site %in% both)

sapply(split(cnt0, cnt0$county.site), nrow)



###
mn0 <- with(pm0,tapply(Sample.Value,State.Code,mean,na.rm=TRUE))
mn1 <- with(pm1,tapply(Sample.Value,State.Code,mean,na.rm=TRUE))
d0 <- data.frame(state = names(mn0), mean = mn0) 
d1 <- data.frame(state = names(mn1), mean = mn1) 
mrg <- merge(d0, d1, by = "state")
with(mrg, plot(rep(1, 52), mrg[, 2], xlim = c(.5, 2.5)))
with(mrg, points(rep(2, 52), mrg[, 3]))
segments(rep(1, 52), mrg[, 2], rep(2, 52), mrg[, 3])

mrg[mrg$mean.x < mrg$mean.y,]
