install.packages('RCurl')
install.packages('RJSONIO')

library('bitops')
library('RCurl')
library('RJSONIO')
library('data.table')
library('plyr')
library(reshape2)



AppVideoURL <- "https://raw.githubusercontent.com/Misterresearch/CUNY-Projects/master/Digital%20App%20Video%20Consumption.csv"

AppVideo <- read.table(file = AppVideoURL, header = TRUE, sep = ",", strip.white = TRUE, na.strings = "", fill = TRUE)


#Recoding work done here, tranformed character values, used levels as reference.
#levels(AppVideo$Network)
AppVideo$Network[AppVideo$Network=="nbcentertainment"] <- "NBC"
AppVideo$Network[AppVideo$Network=="Telemundo Now"] <- "Telemundo"

#App Video Data Frame
AppVideoNetwork <- AppVideo$Network
AppVideoProgram <- AppVideo$Program
AppVideoStarts <- AppVideo$VOD.Episode.Start
#stringAsFactors set to false doesn't seem to convert vars to characters.
AppVideoNetwork = as.character(AppVideoNetwork)
AppVideoNetwork<-tolower(AppVideoNetwork)
AppVideoProgram = as.character(AppVideoProgram)
#discovered iconv, handy for web based data sources.
AppVideoProgram <- iconv(AppVideoProgram,"WINDOWS-1252","UTF-8")
AppVideoProgram<-tolower(AppVideoProgram)
AppVideoDF <- data.frame(AppVideoNetwork, AppVideoProgram, AppVideoStarts, row.names = NULL, check.rows = FALSE, stringsAsFactors = FALSE)


BrowserVideoURL <- "https://raw.githubusercontent.com/Misterresearch/CUNY-Projects/master/Digital%20Desktop%20Video%20Consumption.csv"

BrowserVideo <- read.table(file = BrowserVideoURL, header = TRUE, sep = ",", strip.white = TRUE, na.strings = "", fill = TRUE)

#Recoding work done here, tranformed character values, used levels as reference.
#levels(BrowserVideo$Network)
BrowserVideo$Network[BrowserVideo$Network=="e"] <- "E!"
BrowserVideo$Network[BrowserVideo$Network=="mun2"] <- "NBC Universo"
BrowserVideo$Network[BrowserVideo$Network=="NBCU TVE - Bravo"] <- "Bravo"
BrowserVideo$Network[BrowserVideo$Network=="NBCU TVE - CNBC"] <- "CNBC"
BrowserVideo$Network[BrowserVideo$Network=="NBCU TVE - E!"] <- "E!"
BrowserVideo$Network[BrowserVideo$Network=="NBCU TVE - Esquire"] <- "Esquire"
BrowserVideo$Network[BrowserVideo$Network=="NBCU TVE - MSNBC"] <- "MSNBC"
BrowserVideo$Network[BrowserVideo$Network=="NBCU TVE - NBC"] <- "NBC"
BrowserVideo$Network[BrowserVideo$Network=="NBCU TVE - NBC News"] <- "NBC News"
BrowserVideo$Network[BrowserVideo$Network=="NBCU TVE - NBC Universo"] <- "NBC Universo"
BrowserVideo$Network[BrowserVideo$Network=="NBCU TVE - Oxygen"] <- "Oxygen"
BrowserVideo$Network[BrowserVideo$Network=="NBCU TVE - Sports Network"] <- "Sports Network"
BrowserVideo$Network[BrowserVideo$Network=="NBCU TVE - Sprout"] <- "Sprout"
BrowserVideo$Network[BrowserVideo$Network=="NBCU TVE - Syfy"] <- "Syfy"

#Browser Video Data Frame
BrowserVideoNetwork <- BrowserVideo$Network
BrowserVideoProgram <- BrowserVideo$Program
BrowserVideoStarts <- BrowserVideo$VOD.Episode.Start
#stringAsFactors set to false doesn't seem to convert vars to characters.
BrowserVideoNetwork = as.character(BrowserVideoNetwork)
BrowserVideoNetwork<-tolower(BrowserVideoNetwork)
BrowserVideoProgram = as.character(BrowserVideoProgram)
#discovered iconv, handy for web based data sources.
BrowserVideoProgram <- iconv(BrowserVideoProgram,"WINDOWS-1252","UTF-8")
BrowserVideoProgram<-tolower(BrowserVideoProgram)
BrowserVideoDF <- data.frame(BrowserVideoNetwork, BrowserVideoProgram, BrowserVideoStarts, stringsAsFactors = FALSE)

#grouping using base R, dplyring functions not working.
Browsergroup <-(aggregate(BrowserVideoStarts ~ BrowserVideoNetwork, BrowserVideoDF, sum))
Appgroup <-(aggregate(AppVideoStarts ~ AppVideoNetwork, AppVideoDF, sum))
Browsergroup <- Browsergroup[order(-Browsergroup$BrowserVideoStarts),]
Appgroup <-Appgroup[order(-Appgroup$AppVideoStarts),]

Videomerge <- merge(x=Browsergroup, y=Appgroup, by.x = 'BrowserVideoNetwork', by.y = 'AppVideoNetwork')
AllVideoStarts <-(Videomerge$BrowserVideoStarts +Videomerge$AppVideoStarts)
AllVideoNetworks <-Videomerge$BrowserVideoNetwork
AllVideoDF <- data.frame(AllVideoNetworks, AllVideoStarts, stringsAsFactors = FALSE)
AllVideoDF <-AllVideoDF[order(-AllVideoDF$AllVideoStarts),]


# query neo4J with R
query <- function(querystring) {
  h = basicTextGatherer()
  curlPerform(url="localhost:7474/db/data/cypher",
              postfields=paste('query',curlEscape(querystring), sep='='),
              writefunction = h$update,
              verbose = FALSE
  )
  result <- fromJSON(h$value())
  #print(result)
  data <- data.frame(t(sapply(result$data, unlist)))
  print(data)
  names(data) <- result$columns
}

# import, create node: AllVideoDF (-> nodes)
for (i in 1:nrow(AllVideoDF)) {
  q <- paste("CREATE video={network:\"", AllVideoDF[i, "AllVideoNetworks"], "\" ,views:\"", AllVideoDF[i, "AllVideoStarts"],
"} RETURN video;", sep = ",")
data <- query(q)
}