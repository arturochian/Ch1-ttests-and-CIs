
library(rvest)
nfl_stats <- html("http://espn.go.com/nfl/statistics/team/_/stat/total/seasontype/2")
dat <- nfl_stats %>% 
  html_nodes(".mod-content table") %>% 
  html_table() %>% 
  as.data.frame()
names(dat) <- dat[1, ]
dat <- dat[-1, ]

nfc <- c("New Orleans", 
         "Philadelphia", 
         "Green Bay", 
         "Dallas", 
         "Atlanta", 
         "Seattle", 
         "NY Giants", 
         "Washington", 
         "Carolina", 
         "Detroit", 
         "San Francisco", 
         "Chicago", 
         "Arizona", 
         "Minnesota", 
         "St. Louis", 
         "Tampa Bay")
dat$Conference <- ifelse(dat$TEAM %in% nfc, "NFC", "AFC")
write.csv(dat, "nfl-stats.csv", quote = F, row.names = F)




