library(ggplot2)
data(ToothGrowth)
qplot(dose, len, data = ToothGrowth, color = supp) + geom_smooth(method = "lm") + labs(x = "Vitamin C dose mg", y = "tooth length", title ="Guinea Pigs' Tooth Growth")
ggsave("Tootgrowth.png")

png("Toothgrowth2.png", width = 900, height = 480)
par(mfrow = c(1,2))
boxplot(len ~ dose, ToothGrowth, 
        subset = supp == "VC", col = "yellow",
         main = "Delivery Method - Ascorbic Acid",
         xlab = "Vitamin C dose mg",
         ylab = "tooth length",
         ylim = c(4,35)
)
boxplot(len ~ dose, ToothGrowth, 
        subset = supp == "OJ", col = "red",
        main = "Delivery Method - Orange Juice",
        xlab = "Vitamin C dose mg",
        ylab = "tooth length",
        ylim = c(4,35)
)
dev.off()





t.test(subset(ToothGrowth, dose == 0.5 & supp == "VC")$len, subset(ToothGrowth, dose == 0.5 & supp == "OJ")$len, paired = FALSE, var.equal = TRUE)
t.test(subset(ToothGrowth, dose == 1 & supp == "VC")$len, subset(ToothGrowth, dose == 1 & supp == "OJ")$len, paired = FALSE, var.equal = TRUE)
t.test(subset(ToothGrowth, dose == 2 & supp == "VC")$len, subset(ToothGrowth, dose == 2 & supp == "OJ")$len, paired = FALSE, var.equal = TRUE)