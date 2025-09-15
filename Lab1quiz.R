sessionInfo()

x <- 5
typeof(x)
x<- "a"
typeof(x)
x <- c(2, 2, 4, 5, 7, 10, 11, 9, 10)

print(x[5])
x<- c(1,2,3,4,5)

for(i in x){
  print(i)
}

x <- 1:5
sapply(x, function(v) v^2)

new_x <- 1:5
for (i in new_x) new_x[i] <- x[i]^2
print(new_x)

iris <- read.csv("iris.txt", header = TRUE)

summary(iris)

iris[2,3]
iris$Sepal.Length
iris[[1]]
iris[10:20, ]

#question 23
library(dplyr)

getwd()
datadir <- "~/Documents/Systems Programming fall 2025/Data/"
if (!dir.exists(datadir))  stop("Training data directory not found: ", datadir)
setwd(datadir)
dir()

sales_1 <- read.csv(
  "sales_q1-2.csv",
  na.strings = c("", "NA", "N/A")
)
sales_2 <- read.csv(
  "sales_q2.csv",
  na.strings = c("", "NA", "N/A")
)
products <- read.csv(
  "products_lookup.csv",
  na.strings = c("", "NA", "N/A")
)

head(sales_1)
head(sales_2)
colnames(sales_2) <- c("transaction_id", "region", "product_id", "units_sold")

sales_1$quarter <- "Q1"
sales_2$quarter <- "Q2"
head(sales_1)
head(sales_2)

sales_stacked <- bind_rows(sales_1, sales_2)

dir()
product_lookup <- read.csv("products_lookup.csv")
head(product_lookup)

colnames(product_lookup)[1] <- "product_id"
head(product_lookup)

sales_merged <- sales_stacked %>% left_join(product_lookup, by = "product_id")
head(sales_merged)

