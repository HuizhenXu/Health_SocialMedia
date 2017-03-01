install.packages('twitteR')
library('twitteR')

setup_twitter_oauth(consumer_key='n8PUK7iTjgQREwuKxrjkPOP6V',
                    consumer_secret = 'Sf08MgfsusqHsSdHDIF5FO9IFs0iRGjOdPDGh4MChP4Iu1IZOp',
                    access_token ='3787752262-LsNkktdk23TMm0jcSTsA8S12xtpRWmsOAnZzru9',
                    access_secret ='krzDx3xswxgYtRC8aSRSqhoGI2R2priTcz7JH9L35clLH')

install.packages('dplyr')
library('dplyr')
install.packages('purrr')
library('purrr')

#rm(list=ls())

h<-searchTwitter('amputation',n=10000,lang='en')
comment_h<-tbl_df(map_df(h,as.data.frame))
View(comment_h)
write.table(comment_h,'amputation4.csv',sep=',')



???????????????3000????????????
-----------------------------------------------------




diabetes_tweets<-userTimeline('diabetes',n=3200)
diabetes_tweets_df<-tbl_df(map_df(diabetes_tweets,as.data.frame))

write.table(diabetes_tweets_df,'diabetesdata.csv',sep=',')

install.packages('tidytext')
library('tidytext')

install.packages('tidyr')
library('tidyr')

tweets <- pepsi_tweets_df %>%
  select(id, statusSource, text, created) %>%
  extract(statusSource, "source", "Twitter for (.*?)<")

library('tidytext')

library('stringr')
  

reg <- "([^A-Za-z\\d#@']|'(?![A-Za-z\\d#@]))"
tweet_words <- pepsi_tweets_df %>%
  filter(!str_detect(text, '^"')) %>%
  mutate(text = str_replace_all(text, "https://t.co/[A-Za-z\\d]+|&amp;", "")) %>%
  unnest_tokens(word, text, token = "regex", pattern = reg) %>%
  filter(!word %in% stop_words$word,
         str_detect(word, "[a-z]"))

tweet_words %>% count(word,sort=TRUE)

library('ggplot2')
ggp<-ggplot(data.frame(tweet_words),aes(x=word))

ggp+geom_histogram(fill='lightgreen',stat='count')

library(data.table)

haha<-data.table(tweet_words)
setkey(haha,word)
 tt<-haha[,list(count=.N),by=word]
word.values<-tt[order(count),word][1:10]
word.values

  

ggplot(data=haha,
       +               aes(x=word))+
  +       geom_bar(fill=blues9)+xlim("#1893takesflight",'#2500points','#babababaaba','#bacon')




ggp<-ggplot(data.frame(haha),aes(x=word))

ggp+geom_histogram(fill='lightgreen',stat='count')+xlim("#1893takesflight",'#2500points','#babababaaba','#bacon')



 h<-searchTwitter('T1d',n=10000,lang='en')
comment_h<-tbl_df(map_df(h,as.data.frame))
> View(comment_pepsi)
write.table(comment_h,'T1d.csv',sep=',')
> reg <- "([^A-Za-z\\d#@']|'(?![A-Za-z\\d#@]))"
> pepsi_commentwords <- comment_pepsi %>%
  +     filter(!str_detect(text, '^"')) %>%
  +     mutate(text = str_replace_all(text, "https://t.co/[A-Za-z\\d]+|&amp;", "")) %>%
  +     unnest_tokens(word, text, token = "regex", pattern = reg) %>%
  +     filter(!word %in% stop_words$word,
               +            str_detect(word, "[a-z]"))
> pepsi_commentwords

pepsi_commentwords %>% count(word,sort=TRUE)



comment_sentiment <- pepsi_commentwords %>%
  +          inner_join(get_sentiments("bing"), by = "word") %>% 
  +          count(word,  sentiment) %>% 
  +         spread(sentiment, n, fill = 0) %>% 
  +         mutate(sentiment = positive - negative)
> View(comment_sentiment)

library('tm')
> myCorpus<-Corpus(VectorSource(comment_pepsi$text))
> removeNumPunct<-function(x)gsub('[^[:alpha:][:space:]]*','',x)
> myCorpus<-tm_map(myCorpus,content_transformer(removeNumPunct))
> tdm<-TermDocumentMatrix(myCorpus,control=list(wordLengths=c(1,Inf)))
> findAssocs(tdm,'pepsi',0.2)