#install.packages('twitteR')
library('twitteR')

setup_twitter_oauth(consumer_key='NPJKSzUI0npr0rZ7EYwU3wwM2',
                    consumer_secret = 'mCfwzJ109xXpGF2hZVsGQSS8w8UzCE7lk9BdZ6TdSW4jwyI5Ym',
                    access_token ='405185549-6kaOdKf7nD7o1UNMovBF2wyDwZUqQ36QfwKqcDoA',
                    access_secret ='MdSabwTMY29lrWoaBuJFSrD4W6vS3T4GNKE4B1YyeDXHL')

#install.packages('dplyr')
library('dplyr')
#install.packages('purrr')
library('purrr')

rm(list=ls())

h<-searchTwitter('insulinpump',n=10000,lang='en')
comment_h<-tbl_df(map_df(h,as.data.frame))
View(comment_h)
write.table(comment_h,'insulinpumptest.csv',sep=',')

#name of previously merged file
merged.data<-read.csv("insulinpump-2 test.csv") # read the file
#name of the file created today (the same as line 29)
newdata<-read.csv("insulinpumptest.csv")
#merge the file
all<-rbind(merged.data, newdata) # rbind both data.frames
#clean out duplicate tweets
nonduplicated<-all[!duplicated(all), ]

#dim(newdata)
#dim(merged.data)
#View(nonduplicated)
#dim(nonduplicated)

#export the updated merged file
write.table(nonduplicated,'updated_merged_insulinpump.csv',sep=',')
