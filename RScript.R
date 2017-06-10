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
Filtered<-filter(Selected, Generation==1, !grepl('Mega', Name))
Gen1<-select(Filtered, Name,Total,starts_with("Type"))
arrange(Gen1, desc(Total))
Type<-group_by(Gen1, Type1)
Mean<-summarise(Type,avgT=mean(Total))
arrange(Mean,desc(avgT))
Mean
