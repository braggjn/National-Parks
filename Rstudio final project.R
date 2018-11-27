## Overall Tour ##
install.packages("gmapsdistance")
library(gmapsdistance)
set.api.key("AIzaSyBMO8Hyj6lsza9JLkN0TzCP9cimVxd67n4")

results = gmapsdistance(origin = c("Yosemite+National+Park", "Grand+Canyon", "Redwood+National+Park", "Gardiner+MT", "Bryce+Canyon", "Glacier+National+Park", "Badlands+National+Park", "Arches+National+Park", "Zion+National+Park", "Monument+valley+national+park", "Acadia+national+park", "Congaree+National+Park", "Voyageurs+national+park", "Cuyahoga+Valley+national+park", "Great+Smoky+Mountains+National+Park", "Shenandoah+national+park", "Mammoth+Cave+national+park", "Cape+Cod+national+park", "Isle+Royale+national+park", "Dry+Tortugas+national+park"),
                        destination = c("Yosemite+National+Park", "Grand+Canyon", "Redwood+National+Park", "Gardiner+MT", "Bryce+Canyon", "Glacier+National+Park", "Badlands+National+Park", "Arches+National+Park", "Zion+National+Park", "Monument+valley+national+park", "Acadia+national+park", "Congaree+National+Park", "Voyageurs+national+park", "Cuyahoga+Valley+national+park", "Great+Smoky+Mountains+National+Park", "Shenandoah+national+park", "Mammoth+Cave+national+park", "Cape+Cod+national+park", "Isle+Royale+national+park", "Dry+Tortugas+national+park"), 
                        mode = "driving")
round(results$Distance[,2:21] * 0.000621371192, 2)
df <- round(results$Distance[,2:21] * 0.000621371192, 2)
row.names(df) <- colnames(df)

write.csv(df, file="distance.csv")

install.packages("TSP")
library(TSP)

df <- as.matrix(df)
df <- as.ATSP(df)
tour <- solve_TSP(df, 'nn')
tour_length(tour)
tour <- as.data.frame(tour)


## Tour of West ##
resultsWest = gmapsdistance(origin = c("Yosemite+National+Park", "Grand+Canyon", "Redwood+National+Park", "Gardiner+MT", "Bryce+Canyon", "Glacier+National+Park", "Badlands+National+Park", "Arches+National+Park", "Zion+National+Park", "Monument+valley+national+park"),
                        destination = c("Yosemite+National+Park", "Grand+Canyon", "Redwood+National+Park", "Gardiner+MT", "Bryce+Canyon", "Glacier+National+Park", "Badlands+National+Park", "Arches+National+Park", "Zion+National+Park", "Monument+valley+national+park"), 
                        mode = "driving")
round(resultsWest$Distance[,2:11] * 0.000621371192, 2)
West <- round(resultsWest$Distance[,2:11] * 0.000621371192, 2)
row.names(West) <- colnames(West)

write.csv(West, file="Westdistance.csv")

library(TSP)

West <- as.matrix(West)
West <- as.ATSP(West)
tourWest <- solve_TSP(West, 'nn')
tour_length(tourWest)
tourWest <- as.data.frame(tourWest)


## Tour of East ##
resultsEast = gmapsdistance(origin = c("Acadia+national+park", "Congaree+National+Park", "Voyageurs+national+park", "Cuyahoga+Valley+national+park", "Great+Smoky+Mountains+National+Park", "Shenandoah+national+park", "Mammoth+Cave+national+park", "Cape+Cod+national+park", "Isle+Royale+national+park", "Dry+Tortugas+national+park"),
                        destination = c("Acadia+national+park", "Congaree+National+Park", "Voyageurs+national+park", "Cuyahoga+Valley+national+park", "Great+Smoky+Mountains+National+Park", "Shenandoah+national+park", "Mammoth+Cave+national+park", "Cape+Cod+national+park", "Isle+Royale+national+park", "Dry+Tortugas+national+park"), 
                        mode = "driving")
round(resultsEast$Distance[,2:11] * 0.000621371192, 2)
East <- round(resultsEast$Distance[,2:11] * 0.000621371192, 2)
row.names(East) <- colnames(East)

write.csv(East, file="Eastdistance.csv")

library(TSP)

East <- as.matrix(East)
East <- as.ATSP(East)
tourEast <- solve_TSP(East, 'nn')
tour_length(tourEast)
tourEast <- as.data.frame(tourEast)
