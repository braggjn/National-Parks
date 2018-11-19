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

