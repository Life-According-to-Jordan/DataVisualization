#load packages 
library("ggplot2")
library("psych")
#the iris data set is a preloaded data set in r
iris <- as.data.frame(iris)
#let's look at the data before we start working with it 
head(iris)
#let's get an overview of the data 
summary(iris)
#Descriptive statistics through the psych package
describe(iris)
#Notice that the iris data set is not missing any observations
#Let's visualize the relationship between Sepal.Width and Sepal.Length
ggplot(data=iris,aes(x=Sepal.Width, y=Sepal.Length)) + geom_point() + theme_void()
#We can do better, let's use a different theme that's more helpful
ggplot(data=iris,aes(x=Sepal.Width, y=Sepal.Length)) + geom_point() + theme_minimal()
#Let's visualize the relationship between Petal.Width and Petal.Length
ggplot(data=iris,aes(x=Petal.Width, y=Petal.Length)) + geom_point() + theme_minimal()
#Wow, that's some strong correlation, let's check it out
Petal.Length <- iris$Petal.Length
Petal.Width <- iris$Petal.Width
cor.test(Petal.Length, Petal.Width)
#I digress, let's get back to ggplot2
#we want to visualize the different species so let's add them into our environment now
species <- iris$Species
#Let's plot iris with our species and give it some color
ggplot(data=iris,aes(x=Sepal.Width, y=Sepal.Length, color=species)) + geom_point() + theme_minimal()
#Now, let's smooth our data 
ggplot(data=iris,aes(x=Sepal.Width, y=Sepal.Length, color=species)) + geom_point() + geom_smooth() 
+ theme_minimal()
#What's that error message mean?
#"geom_smooth() using method loess"
#loess is a nonparametric smoothing algorithm that groups data into bundles
#within each bundle a weighted mean is calculated 
#Now, let's view it without the standard error, this removes the grey ribbon, which is
#a 95% confidence interval
ggplot(data=iris,aes(x=Sepal.Width, y=Sepal.Length, color=species)) + geom_point() + 
  geom_smooth(se=FALSE)+
  theme_minimal()
#Now let's tincker with the span arguement 
#span controls the amount of smoothing that is used
ggplot(data=iris,aes(x=Sepal.Width, y=Sepal.Length, color=species)) + geom_point() + 
  geom_smooth(se=FALSE, span = 0.4)+
  theme_minimal()
#Now let's see what it looks like with a span set to 0.8
ggplot(data=iris,aes(x=Sepal.Width, y=Sepal.Length, color=species)) + geom_point() + 
  geom_smooth(se=FALSE, span = 0.8)+
  theme_minimal()
#let's visualize a simple linear regression on the data 
ggplot(data=iris,aes(x=Sepal.Width, y=Sepal.Length, color=species)) + geom_point() + 
  geom_smooth(se=FALSE, method="lm")+
  theme_minimal()
#I think we're starting to see a pattern 
#Let's check out the histograms in ggplot
ggplot(data=iris,aes(x=Sepal.Length)) + geom_histogram() +theme_minimal()
ggplot(data=iris,aes(x=Sepal.Width)) + geom_histogram() +theme_minimal()
#let's add in some parameters
ggplot(data=iris,aes(x=Petal.Length)) + geom_histogram(binwidth=0.3) + theme_minimal()
ggplot(data=iris,aes(x=Petal.Width)) + geom_histogram(binwidth=0.3) + theme_minimal()
#Let's add some color to our histogram 
ggplot(data=iris,aes(x=Sepal.Length,fill=species)) + geom_histogram() + theme_minimal()
#Let's try and see what a density curve would look like in ggplot
ggplot(data=iris,aes(x=Sepal.Length,fill=species)) + geom_density() + theme_minimal() 
#Another one we can look at is geom_density2d()
ggplot(data=iris,aes(x=Petal.Length, y=Petal.Width,color=species)) + geom_density2d() + theme_minimal() 
#There are different species that can be analyzed using a variety of methods 
#Have some fun and try running your own commands on the iris data!  




