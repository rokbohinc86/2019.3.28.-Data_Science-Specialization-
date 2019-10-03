# A way to adjust p values if you have performed more tests
sum(p.adjust(pValues,method="bonferroni") < 0.05)
sum(p.adjust(pValues,method="BH") < 0.05)
