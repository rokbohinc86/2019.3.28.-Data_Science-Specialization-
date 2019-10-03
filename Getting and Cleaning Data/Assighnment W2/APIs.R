
library(httr)
myapp = oauth_app("twitter", key="yourConsumerKeyHere",secret="yourConsumerSecretHere") # start the authorization process
sig = sign_oauth1.0(myapp, token = "yourTokenHere", token_secret = "yourTokenSecretHere") # sighn in into the application
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)

# converting
library(jsonlite)
json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]