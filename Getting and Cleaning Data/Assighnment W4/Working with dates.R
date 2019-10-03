d1 = date() # returns date
d1
class(d1) # but is a character string

d2 = Sys.Date() # returns date
d2
class(d2) # but of class Date

format(d2,"%a %b %d") # you can format Date objects how you want
#%d = day as number (0-31), %a = abbreviated weekday,%A = unabbreviated weekday, 
#%m = month (00-12), %b = abbreviated month, %B = unabbrevidated month, %y = 2 digit year, %Y = four digit year

# Creating dates with as.Date
x = c("1jan1960", "2jan1960", "31mar1960", "30jul1960"); 
z = as.Date(x, "%d%b%Y")
z
z[1] - z[2] # works
as.numeric(z[1]-z[2]) # numeric output

#properties of dates
weekdays(d2)
months(d2)
julian(d2)

# aonther package
library(lubridate) # is great because you can load regardless of what the format is 
ymd("20140108")
ymd("1989-05-17")
mdy("08/04/2013")
dmy("03-04-2013")

ymd_hms("2011-08-03 10:15:03")
ymd_hms("2011-08-03 10:15:03",tz="Pacific/Auckland")
?Sys.timezone

x = dmy(c("1jan2013", "2jan2013", "31mar2013", "30jul2013"))
wday(x[1]) # gives oyu the number of the weekday
wday(x[1],label=TRUE) # gives you the name of the weekday

#swirl
library(lubridate)
his_day <- today()
day(this_day)

this_moment <- now()
minute(this_moment)
update(this_moment, hours = 8, minutes = 34, seconds = 55) # but doesnt actually change the value

ymd(dt2) # dt2 is a collumn

nyc <- now("America/New_York")
depart <- nyc + days(2)
depart <- update(depart,hours = 17, minutes = 34)
arrive <- depart + hours(15) + minutes(50)
arrive <- with_tz(arrive, tzone = "Asia/Hong_Kong" )

last_time <- mdy("June 17, 2008", tz = "Singapore")
how_long <- interval(last_time, arrive)
as.period(how_long)





