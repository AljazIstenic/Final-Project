packages=c("dplyr","ggplot2","ggthemes","ggThemeAssist","gridExtra","plotly")
package.check <- lapply(packages, FUN = function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, dependencies = TRUE)
    library(x, character.only = TRUE)
  }
})

library(readr)
Pokemon <- read_csv("~/GitHub/GroupProject/Pokemon.csv")
View(Pokemon)

Gen1<-select(Pokemon,Name,Total,Generation,starts_with("Type"), Legendary)%>%filter(Generation==1, !grepl('Mega', Name))%>%select(Name,Total,starts_with("Type"))
arrange(Gen1, desc(Total))
TypeMean<-group_by(Gen1, Type1)%>%summarise(avgT=mean(Total))%>%arrange(desc(avgT))
TypeMean
filter(Gen1, Type1=='Ice' | Type2=='Ice')
g <- ggplot(Gen1, aes(x=Type1, y=Total))+geom_point()
g

AvgSpeed<-select(Pokemon, Name,Speed,Generation)%>%group_by(Generation)%>%summarise(avgSpeed=mean(Speed))
AvgSpeed
gSpeed<-ggplot(AvgSpeed, aes(x=Generation, y=avgSpeed))+geom_line()
gSpeed

AvgHP<-select(Pokemon, Name, HP, Generation)%>%group_by(Generation)%>%summarise(avgHP=mean(HP))
AvgHP
gHP<-ggplot(AvgHP, aes(x=Generation, y=avgHP))+geom_line()
gHP

Leg<-filter(Pokemon, Legendary=='TRUE')%>%select(Name,Total, starts_with("Ty"), Generation)%>%arrange(desc(Total))
LegGen<-group_by(Leg, Generation)%>%summarise(avgLeg=mean(Total))%>%arrange(desc(avgLeg))
LegGen
filter(Leg, Generation==1)
gLeg<- ggplot(LegGen, aes(x=Generation, y=avgLeg))+geom_line()
gLeg

GenX<-select(Pokemon, Name, Total, Generation)
GenAvg<-group_by(GenX, Generation)%>%summarise(avgGen=mean(Total))
Genplot<-ggplot(GenAvg, aes(x=Generation, y=avgGen))+geom_bar(stat='Identity')
Genplot
GenAvg
