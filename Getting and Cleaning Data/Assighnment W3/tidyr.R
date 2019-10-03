library(tidyr)
gather(students,sex,count, -grade) # mergers/melts columns together
#sex is new column name of headers, count is the column name of values, -grade specifies which columns to take
separate(data = res, col = sex_class, into = c("sex","class")) # separates a column into multiple columns based on separator sep
# col is the column to be separated, into is a vector of column names to be separated into
spread(students, test, grade) # takes one column and makes their values to columns
# test the column, whose elements should be columns, grade is the value


#### column headers that are values, not variable names -> fuction geather is needed
gather(students, sex, count, -grade)

#### multiple variables are stored in one column -> functions separate is needed
#grade male_1 female_1 male_2 female_2
#1     A      3        4      3        4
#2     B      6        4      3        5
#3     C      7        4      3        8
#4     D      4        0      8        1
#5     E      1        1      2        7

res <- gather(students2, sex_class, count, -grade)

#grade sex_class count
#1      A    male_1     3
#2      B    male_1     6
#3      C    male_1     7
#4      D    male_1     4
#5      E    male_1     1
#6      A  female_1     4
#7      B  female_1     4
#8      C  female_1     4
#9      D  female_1     0
#10     E  female_1     1
#11     A    male_2     3
#12     B    male_2     3
#13     C    male_2     3
#14     D    male_2     8
#15     E    male_2     2
#16     A  female_2     4
#17     B  female_2     5
#18     C  female_2     8
#19     D  female_2     1
#20     E  female_2     7

separate(data = res, col = sex_class, into = c("sex","class"))

#grade    sex class count
#1      A   male     1     3
#2      B   male     1     6
#3      C   male     1     7
#4      D   male     1     4
#5      E   male     1     1
#6      A female     1     4
#7      B female     1     4
#8      C female     1     4
#9      D female     1     0
#10     E female     1     1
#11     A   male     2     3
#12     B   male     2     3
#13     C   male     2     3
#14     D   male     2     8
#15     E   male     2     2
#16     A female     2     4
#17     B female     2     5
#18     C female     2     8
#19     D female     2     1
#20     E female     2     7

#### variables are stored in both rows and columns -> function spread is needed
students3 %>%
        gather(class, grade, class1:class5, na.rm = TRUE) %>%
        spread(test, grade) %>%
        mutate(class = parse_number(class) ) %>% # parse_number gets the number from the string but needs you to call library(readr)        
        print


#### multiple observational units stored in the same table #####
student_info <- students4 %>%
        select(id, name, sex) %>%
        unique %>%
        print


gradebook <- students4 %>%
        select(id, class, midterm, final) %>%
        print
# the data frames are connected with id


########### Joining two data sets ################
passed <- mutate(passed, status = "passed")
failed <- mutate(failed, status = "failed")
bind_rows(passed,failed)


###########################################################################
# 1. select() all columns that do NOT contain the word "total",
# since if we have the male and female data, we can always
# recreate the total count in a separate column, if we want it.
# Hint: Use the contains() function, which you'll
# find detailed in 'Special functions' section of ?select.
sat %>%
        select(-contains("total")) %>%
        gather(key = part_sex, value = count, -score_range) %>%
        separate(part_sex, into = c("part","sex")) %>%
        print


# Append two more function calls to accomplish the following:
#
# 1. Use group_by() (from dplyr) to group the data by part and
# sex, in that order.
#
# 2. Use mutate to add two new columns, whose values will be
# automatically computed group-by-group:
#
#   * total = sum(count)
#   * prop = count / total
#
sat %>%
        select(-contains("total")) %>%
        gather(part_sex, count, -score_range) %>%
        separate(part_sex, c("part", "sex")) %>%
        group_by(part, sex) %>%
        mutate(total = sum(count), prop = count / total  ) %>% print