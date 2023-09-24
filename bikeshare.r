
library(ggplot2)

ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')

head(ny)

head(wash)

head(chi)

# Your solution code goes here

gender_data <- data.frame(city=rep(c("new_york_city", "chicago"),each=2),
                          gender=rep(c("Male", "Female"),2),
                          population=c(sum(ny["Gender"] == "Male"),
                                       sum(ny["Gender"] == "Female"),
                                       sum(chi["Gender"] == "Male"),
                                       sum(chi["Gender"] == "Female")))

ggplot(gender_data, aes(x=city, y=population, fill=gender))+
geom_bar(stat = "identity", position=position_dodge())+
geom_text(aes(label=population), vjust=1.6, color="white",
            position = position_dodge(0.9), size=3.5)

# Your solution code goes here

unique(wash["User.Type"])

data <- wash[wash["User.Type"]=="Subscriber",]["Trip.Duration"]

ggplot(data, aes(x=Trip.Duration)) + 
  geom_histogram(binwidth=0.5, fill="skyblue", color="black", alpha=0.7) + 
  labs(title="Bikeshare Subscriber Users in Washington", x="Trip.Duration", y="Frequency")

# Your solution code goes here

ggplot(ny, aes(x=Birth.Year, y=Trip.Duration)) + 
  geom_point() + labs(title="New York", x="Birth Year", y="Trip Duration")

ggplot(chi, aes(x=Birth.Year, y=Trip.Duration)) + 
  geom_point() + labs(title="Chicago", x="Birth Year", y="Trip Duration")

system('python -m nbconvert Explore_bikeshare_data.ipynb')
