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

Selected<-select(Pokemon,Name,Total,Generation,starts_with("Type"), Legendary)
Gen1<-filter(Selected, Generation==1, !grepl('Mega', Name))%>%select(Name,Total,starts_with("Type"))
arrange(Gen1, desc(Total))
Type<-group_by(Gen1, Type1, Type2)
Mean<-summarise(Type,avgT=mean(Total))
arrange(Mean,desc(avgT))
filter(Gen1, Type2=='Ice')

g <- ggplot(Gen1, aes(x=Type1, y=Total))+geom_point()
g
