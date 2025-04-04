#install.packages("tm")
#install.packages("wordcloud")
#install.packages("SnowballC")
#install.packages("RColorBrewer")

library(tm)
library(wordcloud)
library(SnowballC)
library(RColorBrewer)

filePath <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt"
text<-readLines(filePath)
print(text)

docs<-Corpus(VectorSource(text))
print(docs)
tospace<-content_transformer(function(x,pattern) gsub(pattern," ",x))

docs=tm_map(docs,tospace,"@")
docs=tm_map(docs,tospace,"/")
docs=tm_map(docs,tospace,"\\|")

docs=tm_map(docs,content_transformer(tolower))
docs=tm_map(docs,removeNumbers)
docs=tm_map(docs,removeWords,stopwords("english"))
inspect(docs)

docs <- tm_map(docs, removeWords, c("blabla1", "blabla2")) 
docs <- tm_map(docs, removePunctuation)
docs <- tm_map(docs, stripWhitespace)
docs <- tm_map(docs, stemDocument)

dtm<-TermDocumentMatrix(docs)
inspect(dtm)

m<-as.matrix(dtm)
v<-sort(rowSums(m),decreasing = TRUE)
d<-data.frame(word=names(v),freq=v)
head(d)

wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))
help("wordcloud")

findFreqTerms(dtm,lowfreq = 4)
findAssocs(dtm,terms = "freedom",corlimit = 0.3)

barplot(d[1:10,]$freq, las = 2, names.arg = d[1:10,]$word,
        col ="lightblue", main ="Most frequent words",
        ylab = "Word frequencies")
