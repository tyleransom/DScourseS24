customMean <- function(x){
    mean <- sum(x)/length(x)
    return(mean)
}
df <- data(iris)
# Now let's call the function
sample.average <- customMean(df$Sepal.Width)
print(sample.average)
# Check that it's correct
mean(df$Sepal.Width)