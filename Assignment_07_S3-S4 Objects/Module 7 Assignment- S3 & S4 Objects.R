## I decided to create a Dataset to get more practice in data.frame()
PopStars_Data <- data.frame(
  Name = c(
    "Taylor Swift","Selena Gomez","Ariana Grande",
    "Sabrina Carpenter","Olivia Rodrigo","Dua Lipa","Billie Eilish"
),
  Age = c(35, 33, 32, 26, 22, 30, 23))
#Add column for monthly listeners and top song
PopStars_Data[["Spotify Monthly Listeners (in Millions)"]] <- c(
  96.7, 43.4, 82.5, 76.0, 46.7, 62.4, 91.3
)
PopStars_Data[["Top Song"]] <- c(
  "The Fate of Ophelia","Calm Down","we can't be friends",
  "Manchild","traitor","Cold Heart","BIRDS OF A FEATHER"
)

#Check the data
head(PopStars_Data)
str(PopStars_Data)
summary(PopStars_Data)


#Creating an s3 object
popstar1 <- list(
  name = PopStars_Data$Name,
  age = PopStars_Data$Age,
  spotify_millions = PopStars_Data$`Spotify Monthly Listeners (in Millions)`,
  top_song = PopStars_Data$`Top Song`
)

class(popstar1) <- "popstar_s3"

print(popstar1)
cat("\nClass of popstar1:", class(popstar1), "\n")

# create an S4 object
setClass("popstar_s4",
         slots = c(
           name = "character",
           age = "numeric",
           spotify_millions = "numeric",
           top_song = "character"
         ))

popstar_s4 <- new("popstar_s4",
                  name = "Ariana Grande",
                  age = 32,
                  spotify_millions = 82.5,
                  top_song = "we can't be friends")
show(popstar_s4)

