# Create Object

## create variables0
income <- 5000
expense <- 3000
saving <- income - expense

## remove variables
rm(saving)

## compare values
1 + 1 == 2
2 * 2 <= 4
5 >= 10
5 - 2 != 3
10 < 2
10 > 2

## compare texts/ characters
"Hello" == "hello"

## Data types
# 1. numeric
age <- 32

# 2. character
my_name <- "Toy"
my_university <- 'Kasetsart University'
print(my_name)
print(my_university)
class(my_name); class(my_university)

# 3. logical
result <- 1 + 1 == 2
print(result)
class(result) # "logical"
T
F
TRUE
FALSE

# 4. factor - is categorical var in statistics
animals <- c("Dog", "Cat", "Cat", "Hippo")
class(animals)
#=>"character"
animals
#=> "Dog"   "Cat"   "Cat"   "Hippo"
length(animals) # 4
animals[1] # "Dog"
which(animals == "Hippo") # 4
which(animals == "Cat")   # 2 3

animals <- factor(animals)
class(animals)
#=>"factor"
animals
#=> Dog   Cat   Cat   Hippo
#=> Levels: Cat Dog Hippo

# 5. date
time_now <- Sys.time()
#=> "2023-02-01 22:06:20 +07"
class(time_now)
#=> "POSIXct" "POSIXt"

# 6. NULL (NA)
ages <- c(30, 25, 22, NA, 25)
ages
# [1] 30, 25, 22, NA, 25
is.na(ages)
# [1] FALSE FALSE FALSE  TRUE FALSE
sum(is.na(ages))
# [1] 1

#======================================
## Convert Data Types

## main functions
## as.numeric()
## as.character()
## as.logical()

x <- 100
class(x) #=> "numeric"

char_x <- as.character(x)
char_x #=> "100"

num_x <- as.numeric(char_x)
num_x #=> 100

## logical: TRUE/ FALSE/ 1/ 0
as.logical(0)     #=> FALSE
as.logical(1)     #=> TRUE
as.numeric(TRUE)  #=> 1
as.numeric(FALSE) #=> 0

#======================================
# Data Structure
# 1. Vector
# 2. Matrix
# 3. List
# 4. DataFrame

#-------------
# Vector
# 1 ตัวเก็บข้อมูลได้ 1 ประเภทเท่านั้น
a <- c(1,2,3,4,5)  #=> 1 2 3 4 5
b <- c(1,0,0,1,0)  #=> 1 0 0 1 0
a + b              #=> 2 2 3 5 5

vec1 <- 1:10       #=> 1  2  3  4  5  6  7  8  9 10
vec2 <- rnorm(100)
#  [1]  0.644834782  0.324663543 -1.644260223  0.015841188
#  [5] -1.403414887  0.539693345 -0.075321956  0.910324265
#  [9]  0.717387211  1.328762392  1.109513124 -0.785110192
# [13] -2.416320024  1.186819152 -0.681997204 -0.448809059
# [17]  0.675284607  0.460682822  1.941770008 -1.688453668
# [21]  1.403926709  1.341913072 -0.110433058  0.621812705
# [25] -1.141312280  0.608740196 -0.289799962  0.568248114
# [29] -0.823804888  0.751376825 -0.559269567 -1.473637037
# [33] -0.640089685  0.032146163  0.371093156  0.017034854
# [37]  0.184167743  1.136361335 -0.089846794  0.650633808
# [41]  1.692225282  0.818931320  0.523803154  0.063269340
# [45]  0.176837991  0.803559097 -0.936827796  0.435499937
# [49] -0.526196464  0.956967630  1.302031254  0.001646765
# [53]  0.234052128  0.906507353  0.279306934  0.582979664
# [57] -0.156970268  0.460198557 -1.002574928 -0.426908494
# [61] -1.018153492 -0.436963707  1.567693255 -0.545498203
# [65]  0.619362098  1.790715290 -0.161561265  0.347130914
# [69] -0.128274483  0.538781068  1.194428677 -1.104092339
# [73]  0.894245867  0.348950846  0.287198366 -1.396014667
# [77]  0.022091735 -0.529421566 -1.012963308  0.655308467
# [81] -0.512908882  0.990798861  0.774016834  1.022689734
# [85] -0.806286283  0.849659926  0.513559142 -1.267383609
# [89]  0.719126062 -0.297503127 -0.127890271  0.184312056
# [93]  0.442131353  0.103645397  1.895246732 -2.053581778
# [97]  1.528760031  0.999985765 -1.474893061  0.413097035

vec3 <- rep(c(1,2,3), 10)
# 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3

vec4 <- seq(0, 100, 5)
# 0   5  10  15  20  25  30  35  40  45  50
# 55  60  65  70  75  80  85  90  95 100

    # numeric vector
    friends <- c(30, 31, 25, 29, 32)
    class(friends) # "numeric"

    # logical vector
    is_male <- c(TRUE, FALSE, FALSE)
    is_male <- c(T, F, F)
    class(is_male) # "logical"

    # character vector
    names <- c("Beckham", "Ronaldo", "Toy")
    class(names) # "character"

#-------------
# Matrix

x <- 1:25
length(x) #25
dim(x) <- c(5,5)
#      [,1] [,2] [,3] [,4] [,5]
# [1,]    1    6   11   16   21
# [2,]    2    7   12   17   22
# [3,]    3    8   13   18   23
# [4,]    4    9   14   19   24
# [5,]    5   10   15   20   25

mat1 <- matrix(1:9, nrow = 3)
#      [,1] [,2] [,3]
# [1,]    1    4    7
# [2,]    2    5    8
# [3,]    3    6    9

mat2 <- matrix(1:9, nrow = 3, byrow = TRUE)
#      [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6
# [3,]    7    8    9

mat3 <- matrix(1:10, ncol=2, byrow=TRUE)
# [,1] [,2]
# [1,]    1    2
# [2,]    3    4
# [3,]    5    6
# [4,]    7    8
# [5,]    9   10

mat1 * mat2
#      [,1] [,2] [,3]
# [1,]    1    8   21
# [2,]    8   25   48
# [3,]   21   48   81

mat1 %*% mat2
#      [,1] [,2] [,3]
# [1,]   66   78   90
# [2,]   78   93  108
# [3,]   90  108  126

colnames(mat2) <- c("A", "B", "C")
rownames(mat2) <- c("row1", "row2", "row3")

# combine matrix
cbind(mat1, mat2)
rbind(mat1, mat2)

# element-wise computation
computed_mat1 <- mat1 + 1
#      [,1] [,2] [,3]
# [1,]    2    5    8
# [2,]    3    6    9
# [3,]    4    7   10

computed_mat2 <- mat1 * 100
#      [,1] [,2] [,3]
# [1,]  100  400  700
# [2,]  200  500  800
# [3,]  300  600  900

#-------------
# List
# เก็บข้อมูลได้หลากหลายประเภท

my_playlist <- list(
    fav_movie  = "The Dark Knight",
    fav_song   = "OMG",
    fav_artist = "NewJeans"
)
my_playlist
# $fav_movie
# [1] "The Dark Knight"
#
# $fav_song
# [1] "OMG"
#
# $fav_artist
# [1] "NewJeans"

my_playlist$fav_movie  # "The Dark Knight"
my_playlist$fav_song   # "OMG"
my_playlist$fav_artist # "NewJeans"

my_playlist[1]
# $fav_movie
# [1] "The Dark Knight"

my_playlist[[1]]
# [1] "The Dark Knight"

names <- c("Beckham", "Ronaldo", "Toy")
age <- c(35, 32, 30)
clubs <- c("ManU", "Madrid", "Barcerona")
retired <- c(TRUE, FALSE, FALSE)

my_list <- list(names, age, clubs, retired)
# [[1]]
# [1] "Beckham" "Ronaldo" "Toy"
#
# [[2]]
# [1] 35 32 30
#
# [[3]]
# [1] "ManU"      "Madrid"    "Barcerona"
#
# [[4]]
# [1]  TRUE FALSE FALSE

my_list <- list(player_names = names,
                player_ages = age,
                player_clubs = clubs,
                retired = retired)
# $player_names
# [1] "Beckham" "Ronaldo" "Toy"
#
# $player_ages
# [1] 35 32 30
#
# $player_clubs
# [1] "ManU"      "Madrid"    "Barcerona"
#
# $retired
# [1]  TRUE FALSE FALSE

my_list$player_ages
#=> 35 32 30

my_list$retired
#=> TRUE FALSE FALSE

my_list$player_ages[1] # 35
my_list$player_clubs[1] #"ManU"
my_list[[1]]    # [1] "Beckham" "Ronaldo" "Toy" 
my_list[[1]][2] # "Ronaldo"

#-------------
# DataFrame
# = Table

# View all built-in dataframe provided in R
data()
View(mtcars)

# 1) Direct create DataFrame
cities <- c("BKK", "TOKYO", "LONDON")    # "BKK"    "TOKYO"  "LONDON"
countries <- c("TH", "JPN", "UK")        # "TH"  "JPN" "UK"
population <- c(100000, 200000, 250000)  # 100000 200000 250000

my_df <- data.frame(cities, countries, population)
#   cities countries population
# 1    BKK        TH     100000
# 2  TOKYO       JPN     200000
# 3 LONDON        UK     250000

# 2) create DataFrame from List
cities <- c("BKK", "TOKYO", "LONDON")    # "BKK"    "TOKYO"  "LONDON"
countries <- c("TH", "JPN", "UK")        # "TH"  "JPN" "UK"
population <- c(100000, 200000, 250000)  # 100000 200000 250000

my_list <- list(cities = cities,
                countries = countries,
                population = population)
# $cities
# [1] "BKK"    "TOKYO"  "LONDON"
#
# $countries
# [1] "TH"  "JPN" "UK"
#
# $population
# [1] 100000 200000 250000

my_df <- data.frame(my_list)
#   cities countries population
# 1    BKK        TH     100000
# 2  TOKYO       JPN     200000
# 3 LONDON        UK     250000

View(my_df)
# will show a table in new tab

my_df <- data.frame(countries, cities, population)
#   countries cities population
# 1        TH    BKK     100000
# 2       JPN  TOKYO     200000
# 3        UK LONDON     250000

my_df <- data.frame(
    id = 1:3,
    cc = countries,
    ct = cities,
    pp = population)
#   id  cc     ct     pp
# 1  1  TH    BKK 100000
# 2  2 JPN  TOKYO 200000
# 3  3  UK LONDON 250000

#=================================
## Subset

## Subset Vector
    cities <- c("BKK", "TOKYO", "LONDON")    # "BKK"    "TOKYO"  "LONDON"
    
    ## Subset by position
    cities[1] # "BKK"
    cities[2] # "TOKYO"
    cities[3] # "LONDON"
    cities[4] # NA
    
    ## Subset by slicing from one to one
    cities[1:2] # "BKK"   "TOKYO"
    cities[2:2] # "TOKYO"
    
    ## Subset by selected columns
    friends <- c("Wan", "Ink", "Aan", "Bee", "Top")
    friends[ c(1,3,5)] # "Wan" "Aan" "Top"
    
    ## Subset by condition
    ages <- c(26, 27, 32, 31, 28)
    ages[ ages > 30 ]  # 32 31
    ages[ ages <= 30 ] # 26 27 28
    
    ## Subset by name
    names(ages) <- friends
    ages
    # Wan Ink Aan Bee Top 
    # 26  27  32  31  28
    ages["Wan"] # 26
    ages["Top"] # 28
    
    ages[ c("Wan", "Aan", "Bee") ]
    # Wan Aan Bee 
    # 26  32  31

## Subset DataFrame
    cities <- c("BKK", "TOKYO", "LONDON")    # "BKK"    "TOKYO"  "LONDON"
    countries <- c("TH", "JPN", "UK")        # "TH"  "JPN" "UK"
    population <- c(100000, 200000, 250000)  # 100000 200000 250000
    
    my_df <- data.frame(cities, countries, population)
    # cities countries population
    # 1    BKK        TH     100000
    # 2  TOKYO       JPN     200000
    # 3 LONDON        UK     250000

    my_df[1,2] # "TH"
    my_df[3,1] # "LONDON"
    my_df[2,3] # 2e+05
    
    my_df[1:2, 2]     # "TH"  "JPN"
    my_df[, "cities"] # "BKK"    "TOKYO"  "LONDON"
    my_df[, c(1,2)]
    # #   cities countries
    # 1    BKK        TH
    # 2  TOKYO       JPN
    # 3 LONDON        UK
    my_df[, c("cities","countries")]
    # #   cities countries
    # 1    BKK        TH
    # 2  TOKYO       JPN
    # 3 LONDON        UK
    
    my_df[ my_df$cities == "BKK", ]
    # cities countries population
    # 1    BKK        TH      1e+05
    
    ld_index <- which(my_df$cities == "LONDON")
    # 3
    my_df[ld_index, "cities"] <- "LONDON2"
    my_df[ld_index, "cities"] <- "LONDON"
    
    # subset by condition
    my_df$countries == "TH"
    my_df[my_df$countries == "TH", ]
    #   cities countries population
    # 1    BKK        TH      1e+05
    
    my_df$population > 100000
    my_df[my_df$population > 100000, ]
    #   cities countries population
    # 2  TOKYO       JPN     200000
    # 3 LONDON        UK     250000
    
    conditions <- my_df$countries == "UK" & my_df$population > 100000
    # [1] FALSE FALSE  TRUE
    my_df[conditions, ]
    # cities countries population
    # 3 LONDON        UK     250000
    
    conditions <- my_df$countries == "TH" | my_df$population > 200000
    # [1] TRUE FALSE  TRUE
    my_df[conditions, ]
    # cities countries population
    # 1    BKK        TH     100000
    # 3 LONDON        UK     250000
    
    write.csv(my_df, "city_population.csv", row.names = FALSE)
    
    # read it
    my_df <- read.csv("city_population.csv")
    View(my_df)

#=================================

    # build-in data frame
    data()

    # an example
    data.frame("mtcars")
    
    # partial print
    head(mtcars)
    tail(mtcars)
    dim(mtcars)
    
    # review data structure
    str(mtcars)

    # stats data summary
    summary(mtcars)

#####################################
# CONTROL FLOW
#
# if
# for..loop
# while..loop

# if/ else if/ else
    x <- 5
    
    if (x %% 2 == 0) {
        print("Even number")
    } else {
        print("Odd number")
    }
        
    score <- 58
    
    if (score >= 90) {
        print("Passed")
    } else if (score >= 50) {
        print("OK")
    } else {
        print("Enroll again!")
    }
    
    # ifelse function
    a <- c(1,3,5,2,5,6)
    ifelse(a %% 2 == 0, "Even", "Odd")
    
    score <- 25
    ifelse(score >= 90, "Passed", ifelse(
        score >= 50, "OK", "Enroll Again!"
    ))

# for (avoid it - not efficient)
    x <- 1:10
    for (i in x) {
        print(i)
    }
    # [1] 1
    # [1] 2
    # [1] 3
    # [1] 4
    # [1] 5
    # [1] 6
    # [1] 7
    # [1] 8
    # [1] 9
    # [1] 10
    
    friends <- c("Toy", "John", "Mary", "Anna")
    for (friend in friends) {
        print(friend)
    }
    # [1] "Toy"
    # [1] "John"
    # [1] "Mary"
    # [1] "Anna"
    
    friends <- c("Toy", "John", "Mary", "Anna")
    for (friend in friends) {
        print( paste("Hi!", friend) )
    }
    # [1] "Hi! Toy"
    # [1] "Hi! John"
    # [1] "Hi! Mary"
    # [1] "Hi! Anna"
    
    # Vectorization
    paste("Hi!", friends)
    # "Hi! Toy"  "Hi! John" "Hi! Mary" "Hi! Anna"
    
    nums <- c(5, 10, 12, 20, 25)
    nums <- nums + 2
    # 7 12 14 22 27
    (nums <- nums + 2)
    # 9 14 16 24 29

# while
    x <- 0
    
    while (x <= 10) {
        print(paste(x, "less than or equal than 10"))
        x <- x +1
    }
    
    (1:10) ** 2
    # [1]   1   4   9  16  25  36  49  64  81 100
    
    paste("Hi,", c("Toy", "Lisa", "Jisoo"))
    # [1] "Hi, Toy"   "Hi, Lisa"  "Hi, Jisoo"
    
    paste("Hi,", toupper(c("Toy", "Lisa", "Jisoo")))
    # [1] "Hi, TOY"   "Hi, LISA"  "Hi, JISOO"

#####################################
# FUNCTIONS
    
    x <- 1:100
    
    mean(x)
    sum(x)
    median(x)
    sd(x)
    var(x)
    
    help(mean)
    
    yy <- c(1:10, NA, 20, 25)
    mean(yy)
    mean(yy, na.rm = TRUE)
    
    help("fivenum")
    x <- 1:1000
    fivenum(x)

# user-defined function
    my_func1 <- function() {
        print("Hello World")
        print("I'm here to learn R basics")
    }
    my_func1()
    
    my_func2 <- function(x) {
        print(x^2)
    }
    my_func2(6)
    
    my_func3 <- function(a, b) {
        return(a + b)
    }
    my_func3(3, 5)
    my_func3(100, 822)

# default value
    greeting_name <- function(name = "Toy") {
        print( paste("Hello!", name) )
    }
    greeting_name()               # "Hello! Toy"
    greeting_name(name = "Mary")  # "Hello! Mary"
    greeting_name("Mary")         # "Hello! Mary"

    func1 <- function(a, b=100) {
        return(a+b)
    }
    func1(a=100)          # 200
    func1(a=100, b=50)    # 1
    func1(100)            # 200
    func1(100, 50)        # 150
    func1(b=33, a=55)     # 88

# Examples
    # add_two_nums() function
    add_two_nums <- function(val1, val2) {
        val1 + val2
    }
    
    # cube() function
    cube <- function(base, power=3) {
        return(base ** power)
    }
    cube(5, 4) # 625
    cube(base = 5, power = 4) # 625
    
    # count_ball() function
    balls <- c("red", "red", "blue", "green",
                    "green", "green", "green", "red")
                    
    count_ball <- function(balls, color) {
        sum(balls == color)
    }
    count_ball(balls, "red")   # 3
    count_ball(balls, "blue")  # 1
    count_ball(balls, "green") # 4
    
    greeting_bot <- function() {
        username = readline("What's your name: ")
        print(paste("Hello! ", username))
        
        your_age = readline("How old are you?")
        your_age = as.numeric(your_age)
        print(your_age * 2)
        print(paste("You are", your_age, "year old."))
    }
    greeting_bot()
    
#####################################
# WORKING WITH DATA FRAME
    # build-in datasets
    data()
    USArrests # dataset example
    class(USArrests) # "table"
    
# Ex 1
    View(mtcars)
    
    mean(mtcars$mpg)
    mean(mtcars$hp)
    colMeans(mtcars)
    rowMeans(mtcars)
    colSums(mtcars)
    rowSums(mtcars)
    names(mtcars)
    
    # subset data frame
    head(mtcars)
    
    m <- mtcars    
    
    head(m)
    mtcars[3, 6]
    mtcars[6, 6]
    mtcars[1:2, ]
    mtcars[1:2, 1:5]
    
    # subset rows by logic
    head(m)
    mtcars[mtcars$mpg >= 30, ]
    mtcars[mtcars$mpg >= 30 & mtcars$wt < 2, ]
    mtcars[mtcars$mpg >= 30 | mtcars$wt < 2, ]
    
    # package: dplyr
    # 5 verbs:
    # - select()
    # - filter()
    # - arrange()
    # - mutate()
    # - summarise()
    # 1 advers
    # - group_by()
    
    mtcars
    dim(mtcars)
    
    # print output to fit in current screen
    tibble::as_tibble(mtcars)
    
    m <- tibble::as_tibble(mtcars)
    head(m)
    tail(m)
    summary(m)    
    str(m)
    
    # SELECT
    select(m, mpg, cyl, am, hp, wt)
    select(m, 1:5)
    select(m, 1:3, 5, 11)    
    
    # FILTER
    filter(m, mpg > 30)
    filter(m, hp < 200 & am == 1)
    
    # ARRANGE
    arrange(m, hp)
    arrange(m, desc(hp))  
    
    # MUTATE
    mutate(m, hp/100)
    mutate(m, hp.100 = hp/100)
    
    # SUMMARISE
    summarise(m, mean(hp), max(hp), min(hp))
    summarise(m, avg_hp = mean(hp),
              max_hp = max(hp),
              min_hp = min(hp))
    
    # PIPING %>%
    head(m)
    m %>% head()    
    m %>% head() %>% head(1)
    m %>% select(mpg, cyl, hp) %>%
        filter(hp > 200) %>%
        arrange(desc(hp)) %>%
        summarise(mean(hp))
    
    # GROUP_BY
    m %>%
        group_by(am) %>%
        summarise(mean(hp))
    
# Ex 2
    View(USArrests)
    
    mean(USArrests$Murder) # 7.788
    nrow(USArrests) # 50
    ncol(USArrests) # 4
    head(USArrests)
    #            Murder Assault UrbanPop Rape
    # Alabama      13.2     236       58 21.2
    # Alaska       10.0     263       48 44.5
    # Arizona       8.1     294       80 31.0
    # Arkansas      8.8     190       50 19.5
    # California    9.0     276       91 40.6
    # Colorado      7.9     204       78 38.7
    
    for (i in 1:ncol(USArrests)) {
        print( names(USArrests)[i] )
    }
    # [1] "Murder"
    # [1] "Assault"
    # [1] "UrbanPop"
    # [1] "Rape"
    names(USArrests)
    # [1] "Murder"   "Assault"  "UrbanPop" "Rape"
    
    cal_mean_by_col <- function(df) {
        col_names <- names(df)
        
        for (i in 1:ncol(df)) {
            avg_col <- mean(df[[i]]) 
            print(paste(col_names[i], ":", avg_col))
        }
    }
    cal_mean_by_col(mtcars)
    # [1] "mpg : 20.090625"
    # [1] "cyl : 6.1875"
    # [1] "disp : 230.721875"
    # [1] "hp : 146.6875"
    # [1] "drat : 3.5965625"
    # [1] "wt : 3.21725"
    # [1] "qsec : 17.84875"
    # [1] "vs : 0.4375"
    # [1] "am : 0.40625"
    # [1] "gear : 3.6875"
    # [1] "carb : 2.8125"

#####################################
# apply() coolest function
    
# by column
    apply(mtcars, MARGIN=2, mean)
    # mpg        cyl       disp         hp       drat         wt 
    # 20.090625   6.187500 230.721875 146.687500   3.596563   3.217250 
    # qsec         vs         am       gear       carb 
    # 17.848750   0.437500   0.406250   3.687500   2.812500
    apply(mtcars, MARGIN=2, sum)
    apply(mtcars, MARGIN=2, sd)
    apply(mtcars, MARGIN=2, median)
    
# by row
    apply(mtcars, MARGIN=1, mean)
    #           Mazda RX4       Mazda RX4 Wag          Datsun 710
    #            29.90727            29.98136            23.59818
    #      Hornet 4 Drive   Hornet Sportabout             Valiant
    #            38.73955            53.66455            35.04909
    #          Duster 360           Merc 240D            Merc 230
    #            59.72000            24.63455            27.23364
    #            Merc 280           Merc 280C          Merc 450SE
    #            31.86000            31.78727            46.43091
    #          Merc 450SL         Merc 450SLC  Cadillac Fleetwood
    #            46.50000            46.35000            66.23273
    # Lincoln Continental   Chrysler Imperial            Fiat 128
    #            66.05855            65.97227            19.44091
    #         Honda Civic      Toyota Corolla       Toyota Corona
    #            17.74227            18.81409            24.88864
    #    Dodge Challenger         AMC Javelin          Camaro Z28
    #            47.24091            46.00773            58.75273
    #    Pontiac Firebird           Fiat X1-9       Porsche 914-2
    #            57.37955            18.92864            24.77909
    #        Lotus Europa      Ford Pantera L        Ferrari Dino
    #            24.88027            60.97182            34.50818
    #       Maserati Bora          Volvo 142E
    #            63.15545            26.26273
    
#####################################
# Read table
library(readr)

# Text file
    students <- read_table("student.txt")
    View(students)
    
# CSV
    students <- read_csv("student.csv")
    View(students)
    
# Excel
    library(readxl)
    students <- read_excel("students.xlsx", sheet=1)
    students <- read_excel("students.xlsx", sheet="Data")
    View(students)
    
    students <- read_excel("students.xlsx", sheet=2)
    students <- read_excel("students.xlsx", sheet="Econommics")
    View(students)
    
    students <- read_excel("students.xlsx", sheet=3)
    students <- read_excel("students.xlsx", sheet="Business")
    View(students)
    
    # with list()
    result <- list()
    
    for (i in 1:3) {
        result[[i]] <- read_excel("students.xlsx", sheet=i)
    }
    result

# Google Sheets
    library(googlesheets4)
    url <- "https://docs.google.com/spreadsheets/d/1yy7RhfVzQu94EG6w6Fi7j9wmP5rzxG89-CBJLxnNS-o"
    gs4_deauth()
    df <- read_sheet(url, sheet="students")
    View(df)
    
# JSON
    library(jsonlite)
    fromJSON("blackpink.json") # data will be Lists
    # $id
    # [1] 1 2 3 4 5
    #
    # $name
    # [1] "toy"   "john"  "marry" "lisa"  "jisoo"
    #
    # $love_singing
    # [1]  TRUE FALSE FALSE  TRUE  TRUE
    df <- data.frame(fromJSON("blackpink.json"))
    View(df)
    
# Bind Rows (UNION ALL)
    econ <- read_excel("students.xlsx", sheet=1)
    business <- read_excel("students.xlsx", sheet=2)
    data <- read_excel("students.xlsx", sheet=3)
    econ; business; data
    # A tibble: 5 × 3
    #  student_id name  major
    #       <dbl> <chr> <chr>
    # 1          1 toy   economics
    # 2          2 john  economics
    # 3          3 mary  economics
    # 4          4 anna  economics
    # 5          5 lisa  economics
    # # A tibble: 5 × 3
    #   student_id name  major
    #        <dbl> <chr> <chr>
    # 1          6 henry business
    # 2          7 david business
    # 3          8 jisoo business
    # 4          9 jenny business
    # 5         10 kevin business
    # # A tibble: 5 × 3
    #   student_id name   major
    #        <dbl> <chr>  <chr>
    # 1         11 andrew data
    # 2         12 yan    data
    # 3         13 yoshua data
    # 4         14 jane   data
    # 5         15 nanny  data
    
    library(dplyr)
    bind_rows(econ, data)
    # # A tibble: 10 × 3
    #    student_id name   major
    #         <dbl> <chr>  <chr>
    #  1          1 toy    economics
    #  2          2 john   economics
    #  3          3 mary   economics
    #  4          4 anna   economics
    #  5          5 lisa   economics
    #  6         11 andrew data
    #  7         12 yan    data
    #  8         13 yoshua data
    #  9         14 jane   data
    # 10         15 nanny  data
    
    # use list to deal with many DataFrame
    list_df <- list(econ, business, data)
    full_df <- bind_rows(list_df)
    
# Bind Cols (!= JOIN)
    df1 <- data.frame(
        id = 1:5,
        name = c("John", "Marry", "Anna", "David", "Lisa")
    )
    
    df2 <- data.frame(
        city = c( rep("BKK", 3), rep("LONDON", 2) ),
        country = c( rep("TH", 3), rep("UK", 2) )
    )
    
    df1
    #   id  name
    # 1  1  John
    # 2  2 Marry
    # 3  3  Anna
    # 4  4 David
    # 5  5  Lisa

    df2
    #     city country
    # 1    BKK      TH
    # 2    BKK      TH
    # 3    BKK      TH
    # 4 LONDON      UK
    # 5 LONDON      UK
    
    bind_cols(df1, df2)
    #   id  name   city country
    # 1  1  John    BKK      TH
    # 2  2 Marry    BKK      TH
    # 3  3  Anna    BKK      TH
    # 4  4 David LONDON      UK
    # 5  5  Lisa LONDON      UK
    
    bind_cols(df2, df1)
    #     city country id  name
    # 1    BKK      TH  1  John
    # 2    BKK      TH  2 Marry
    # 3    BKK      TH  3  Anna
    # 4 LONDON      UK  4 David
    # 5 LONDON      UK  5  Lisa
    
# Left Join
    df1 <- data.frame(
        id = 1:5,
        name = c("John", "Marry", "Anna", "David", "Lisa")
    )
    
    df2 <- data.frame(
        id = 1:5,
        city = c( rep("BKK", 3), rep("LONDON", 2) ),
        country = c( rep("TH", 3), rep("UK", 2) )
    )
    
    df1
    #   id  name
    # 1  1  John
    # 2  2 Marry
    # 3  3  Anna
    # 4  4 David
    # 5  5  Lisa
    
    df2
    #   id   city country
    # 1  1    BKK      TH
    # 2  2    BKK      TH
    # 3  3    BKK      TH
    # 4  4 LONDON      UK
    # 5  5 LONDON      UK
    
    left_join(df1, df2)
    # Joining with `by = join_by(id)`
    #   id  name   city country
    # 1  1  John    BKK      TH
    # 2  2 Marry    BKK      TH
    # 3  3  Anna    BKK      TH
    # 4  4 David LONDON      UK
    # 5  5  Lisa LONDON      UK

# SQL
    library(sqldf)
    library(readr)
    
    school <- read_csv("school.csv")
    #Rows: 5 Columns: 5                        
    #── Column specification ────────────────────────────────────────────
    #Delimiter: ","
    #chr (2): school_name, country
    #dbl (2): school_id, student
    #lgl (1): top10
    
    sqldf("select * from school;")
    #   school_id          school_name country student top10
    # 1         1 University of London      UK   50000 FALSE
    # 2         2            Cambridge      UK   65000  TRUE
    # 3         3               Oxford      UK   32000  TRUE
    # 4         4              Harvard     USA   48000  TRUE
    # 5         5                  MIT     USA   62000  TRUE
    
    sqldf("
      select
    		avg(student),
    	  sum(student)
      from school;
    ")
    # avg(student) sum(student)
    # 1        51400       257000
    
    sqldf("
      select
        school_id,
        school_name,
        country
      from school;
    ")
    #   school_id          school_name country
    # 1         1 University of London      UK
    # 2         2            Cambridge      UK
    # 3         3               Oxford      UK
    # 4         4              Harvard     USA
    # 5         5                  MIT     USA
    
    sql_query <- "select * from school where country = 'USA';"
    usa_school <- sqldf(sql_query)
    # school_id school_name country student top10
    # 1         4     Harvard     USA   48000  TRUE
    # 2         5         MIT     USA   62000  TRUE

# SQLite
    # load library
    library(RSQLite)
    
    # connect to SQLite database (.db file)
    # 1. open connection
    conn <- dbConnect(SQLite(), "chinook.db")
    
    # 2. get data
    dbListTables(conn)
    dbListFields(conn, "customers")
    
    df <- dbGetQuery(conn, "select * from customers where country = 'USA'")
    View(df)
    
    df2 <- dbGetQuery(conn, "select * from customers where country = 'United Kingdom'")
    View(df2)
    
    # 3. close connection
    dbDisconnect(conn)
    
#####################################
# BASE R GRAPHIC
#
# scatter plot
# histogram
# boxplot

m <- mtcars
head(m)
names(m)

# scatter plot
plot(m$hp, m$mpg)
plot(m$hp, m$mpg, pch = 16)
plot(m$hp, m$mpg, pch = 16, col = "gold",
     xlab = "horse power",
     ylab = "mile per gallon",
     main = "R Scatter Plot")

# histogram
hist(m$mpg)
hist(m$mpg, col = "salmon", border = NA,
     xlab = "mile per gallon",
     ylab = "frequency (count)",
     main = "HISTOGRAM (MPG)")

    # cool trick
    hist(m$mpg, probability = TRUE)
    lines(density(m$mpg))


# boxplot
boxplot(m$mpg)
summary(m$mpg)

boxplot(m$mpg, col = "salmon",
        main = "Boxplot of MPG")

    # cool trick
    table(m$am)
    
    boxplot(m$mpg ~ m$am)
    boxplot(m$mpg ~ m$am, col = c("salmon", "gold"))

# barplot
barplot(m$mpg)

#####################################
# color listings
colors()
#####################################
# ggplot2

m <- mtcars
names(m)

ggplot(data = m, aes(x=hp, y=mpg))
ggplot(data = m, aes(x=hp, y=mpg)) + geom_point()
ggplot(data = m, aes(x=hp, y=mpg)) + geom_point() + geom_smooth()
ggplot(data = m, aes(x=hp, y=mpg)) +
    geom_point(size = 5,
               alpha = 0.8,
               col = "lightgoldenrod")

ggplot(data = m, aes(x=mpg)) +
    geom_histogram(bins = 5, fill = "gold", alpha = 0.5) +
    labs(x = "mile per gallon",
         y = "count/ frequency",
         title = "My ggplot histogram") +
    theme_minimal()

#####################################
## Regular Expression

# data example - states
state.name

# Regexp
citiy_start_A <- grep("^K", state.name)
# [1] "Kansas", "Kentucky"
state.name[citiy_start_A]
# [1] "Kansas"   "Kentucky"

citiy_end_s <- grep("s$", state.name)
# [1]  4 13 16 21 43
state.name[citiy_end_s]
# [1] "Arkansas"      "Illinois"      "Kansas"        "Massachusetts"
# [5] "Texas"

citiy_contain_new <- grep("new", state.name, ignore.case = TRUE)
# [1] 29 30 31 32
state.name[citiy_contain_new]
# [1] "New Hampshire" "New Jersey"    "New Mexico"    "New York"
