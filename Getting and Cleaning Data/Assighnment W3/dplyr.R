# select(DF, colname1:colname4)
# filter(DF, columnname > 30)
# arrange(DF, columnname) sorts the dt according to one column
# rename(DF, newcolumnname = oldcolumnname)
# mutate(DF, newcolumname = columname- mean(columnaname, na.rm=TRUE))
# grouped_by(DF, columnname) --- groups DF based on the values of the column name, physically its still the same table, but has an additional class. Works good with sumarize
# sumarize(DF, define columname = (mean, max, median(existing column names)), define columname, ...)

# chain opperation lets you fead a data frame to a chain of opperations to get a dataframe
# DF %>% mutate() %>% group_by %>% sumarize

# MANIPULATING DATA

library(dplyr)

path2csv <- "/home/rok/R/x86_64-pc-linux-gnu-library/3.5/swirl/Courses/Getting_and_Cleaning_Data/Manipulating_Data_with_dplyr/2014-07-08.csv"
mydf <- read.csv(path2csv, stringsAsFactors = FALSE)
cran <- tbl_df(mydf)

# with select you can control columns
select(cran, ip_id, package, country)
select(cran, r_arch:country)
select(cran, -time)
select(cran, -(X:size))
select(cran, -(X:size))

# with filter you can control rows
filter(cran, r_version == "3.1.1", country == "US")
filter(cran, r_version <= "3.0.2", country == "IN")
filter(cran, country == "US" | country == "IN")
filter(cran, size > 100500, r_os == "linux-gnu")
filter(cran, !is.na(r_version))

# arragne data
cran2 <- select(cran, size:ip_id)
arrange(cran2, ip_id)
arrange(cran2, desc(ip_id))
arrange(cran2, package, ip_id)

#mutate
cran3 <- select(cran, ip_id, package, size)
mutate(cran3, size_mb = size / 2^20)
mutate(cran3, size_mb = size / 2^20, size_gb = size_mb / 2^10)
mutate(cran3, correct_size = size + 1000)

#sumarize
summarize(cran, avg_bytes = mean(size))

# group_by
by_package <- group_by(cran, package)
summarize(by_package, mean(size))

#manipulation...
pack_sum <- summarize(by_package,
                      count = n(),
                      unique = n_distinct(ip_id),
                      countries = n_distinct(country),
                      avg_bytes = mean(size))

a <- quantile(pack_sum$count, probs = 0.99) # take top 1 %
top_counts <- filter(pack_sum, count > a) #filter out
top_counts_sorted <- arrange(top_counts, desc(count)) # sort


# pipes
result3 <-
        cran %>%
        group_by(package) %>%
        summarize(count = n(),
                  unique = n_distinct(ip_id),
                  countries = n_distinct(country),
                  avg_bytes = mean(size)
        ) %>%
        filter(countries > 60) %>%
        arrange(desc(countries), avg_bytes)
print(result3)


cran %>% select(ip_id, country, package, size) %>% print
