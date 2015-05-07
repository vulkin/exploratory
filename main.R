nie<-readRDS("C:/Users/Nikhil/Desktop/R/exploratory/project 2/summarySCC_PM25.rds")

library(dplyr)
#plot1
nieg<-tbl_df(nie)

nieg<-group_by(nieg,year)
totalem<-summarize(nieg,sum(Emissions))

plot(totalem,type="l",xlab="Year",ylab="Toal emissions from all sources",main="Total emissions from 1999-2008")
dev.copy(png,"plot1.png")
dev.off()

#plot2
library(dplyr)
nie<-tbl_df(nie)
balti<-filter(nie,fips=="24510")
balti<-group_by(balti,year)
totalembalti<-summarize(balti,sum(Emissions))
plot(totalembalti,col="red",type="l",xlab="Year",ylab="Toal emissions from all sources",main="Total emissions in Baltimore from 1999-2008")
dev.copy(png,"plot2.png")
dev.off()


#plot3

balti1<-group_by(balti,year,type)
baltiem<-summarize(balti1,sum(Emissions))
names(baltiem)[3]="Emissions"
qplot(year,Emissions,data=baltiem,facets=.~type)
dev.copy(png,"plot3.png",width=720)
dev.off()


#plot4
so<-readRDS("C:/Users/Nikhil/Desktop/R/exploratory/project 2/Source_Classification_Code.rds")

