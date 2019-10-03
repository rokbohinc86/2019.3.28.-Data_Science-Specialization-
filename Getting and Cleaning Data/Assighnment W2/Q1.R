library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github", key = "2651ae7b979ea892b978", secret = "e765cad3b70db39e4cc3a0857c35f0c646632e0c",
    redirect_uri = "http://localhost:1410")

# 3. Get OAuth credentials
github_token <- oauth1.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
json1 = content(req)
library(jsonlite)
json2 = jsonlite::fromJSON(toJSON(json1))
json2$created_at [json2$name=="datasharing"]


# OR:
#req <- with_config(gtoken, GET("https://api.github.com/users/jtleek/repos"))
#stop_for_status(req)
#content(req)
