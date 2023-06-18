## install package - run only once
install.packages("dplyr")

## load library - everytime new open R program
library(dplyr)

############################################
## read CSV into RStudio
imdb <- read.csv("data transforming/imdb.csv", stringsAsFactors = FALSE)
View(imdb)

## review data structure
glimpse(imdb)
# Rows: 100
# Columns: 7
# $ NO         <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, …
# $ MOVIE_NAME <chr> "The Shawshank Redemption", "The Godfather", "T…
# $ YEAR       <int> 1994, 1972, 2008, 1974, 2003, 1994, 1993, 1957,…
# $ RATING     <chr> "R", "R", "PG-13", "R", "PG-13", "R", "R", "App…
# $ LENGTH     <int> 142, 175, 152, 202, 201, 154, 195, 96, 148, 139…
# $ GENRE      <chr> "Drama", "Crime, Drama", "Action, Crime, Drama"…
# $ SCORE      <dbl> 9.3, 9.2, 9.0, 9.0, 8.9, 8.9, 8.9, 8.9, 8.8, 8.…

## print head and tail of data

# print 5 first rows
head(imdb, 5)
#   NO                                    MOVIE_NAME YEAR RATING
# 1  1                      The Shawshank Redemption 1994      R
# 2  2                                 The Godfather 1972      R
# 3  3                               The Dark Knight 2008  PG-13
# 4  4                        The Godfather: Part II 1974      R
# 5  5 The Lord of the Rings: The Return of the King 2003  PG-13
#   LENGTH                    GENRE SCORE
# 1    142                    Drama   9.3
# 2    175             Crime, Drama   9.2
# 3    152     Action, Crime, Drama   9.0
# 4    202             Crime, Drama   9.0
# 5    201 Action, Adventure, Drama   8.9

# print 5 last rows
tail(imdb, 5)
#      NO          MOVIE_NAME YEAR RATING LENGTH           GENRE
# 96   96              Amélie 2001      R    122 Comedy, Romance
# 97   97              Snatch 2000      R    102   Comedy, Crime
# 98   98 Requiem for a Dream 2000      R    102           Drama
# 99   99     American Beauty 1999      R    122           Drama
# 100 100   Good Will Hunting 1997      R    126  Drama, Romance
#     SCORE
# 96    8.3
# 97    8.3
# 98    8.3
# 99    8.3
# 100   8.3

############################################
## select columns + pipe operator

names(imdb)
# [1] "NO"         "MOVIE_NAME" "YEAR"       "RATING"     "LENGTH"    
# [6] "GENRE"      "SCORE"

select(imdb, MOVIE_NAME, RATING)
#                                                               MOVIE_NAME
# 1                                               The Shawshank Redemption
# 2                                                          The Godfather
# ...
# 100                                                    Good Will Hunting
#        RATING
# 1           R
# 2           R
# ...
# 100         R

select(imdb, 1, 5)
#      NO LENGTH
# 1     1    142
# 2     2    175
# 3     3    152
# 4     4    202
# ...
# 100 100    126

# เปลี่ยนชื่อ column
select(imdb, movie_name = MOVIE_NAME, release_year = YEAR)
#                                                               movie_name
# 1                                               The Shawshank Redemption
# 2                                                          The Godfather
# ...
# 100                                                    Good Will Hunting
#     release_year
# 1           1994
# 2           1972
# ...
# 100         1997

## PIPE OPERATOR
# Examples
select(mtcars, mpg, wt, hp)
mtcars %>% select(mpg, wt, hp)

# 2 คำสั่งนี้ ได้ผลลัพธ์เท่ากัน
head(imdb)
imdb %>% head

imdb %>%
    select(movie_name = MOVIE_NAME, released_year = YEAR) %>%
    head(10)
#                                       movie_name released_year
# 1                       The Shawshank Redemption          1994
# 2                                  The Godfather          1972
# 3                                The Dark Knight          2008
# 4                         The Godfather: Part II          1974
# 5  The Lord of the Rings: The Return of the King          2003
# 6                                   Pulp Fiction          1994
# 7                               Schindler's List          1993
# 8                                   12 Angry Men          1957
# 9                                      Inception          2010
# 10                                    Fight Club          1999

############################################
## Filter Data Part I
filter(imdb, SCORE >= 9.0)
#   NO               MOVIE_NAME YEAR RATING LENGTH                GENRE SCORE
# 1  1 The Shawshank Redemption 1994      R    142                Drama   9.3
# 2  2            The Godfather 1972      R    175         Crime, Drama   9.2
# 3  3          The Dark Knight 2008  PG-13    152 Action, Crime, Drama   9.0
# 4  4   The Godfather: Part II 1974      R    202         Crime, Drama   9.0

imdb %>% filter(SCORE >= 9.0)

# เปลี่ยน column name จาก capital charaters เป็นตัวพิมพ์เล็ก
names(imdb) <- tolower(names(imdb))
names(imdb)
# [1] "no"         "movie_name" "year"       "rating"     "length"    
# [6] "genre"      "score"

imdb %>%
    select(movie_name, year, score) %>%
    filter(score >= 9 & year > 2000)
#        movie_name year score
# 1 The Dark Knight 2008     9

imdb %>%
    select(movie_name, year, score) %>%
    filter(score == 9.0 | score == 9.2)
#               movie_name year score
# 1          The Godfather 1972   9.2
# 2        The Dark Knight 2008   9.0
# 3 The Godfather: Part II 1974   9.0

imdb %>%
    select(movie_name, year, score) %>%
    filter(score %in% c(9.0, 9.2))
#               movie_name year score
# 1          The Godfather 1972   9.2
# 2        The Dark Knight 2008   9.0
# 3 The Godfather: Part II 1974   9.0

## Filter Data Part II - filter string columns
imdb %>%
    select(movie_name, genre, rating) %>%
    filter(rating == "R")

# การดึง column จาก datafame
imdb$genre
# [1] "Drama"                         "Crime, Drama"                  "Action, Crime, Drama"
# [4] "Crime, Drama"                  "Action, Adventure, Drama"      "Crime, Drama"
# [7] "Biography, Drama, History"     "Crime, Drama"                  "Action, Adventure, Sci-Fi"
# ...

# search by pattern
# สิ่งที่ต้องระวังคืแ `grepl()` เป็น case sensitive
grepl("Drama", imdb$genre)
#   [1]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE
#  [18] FALSE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
#  [35]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE FALSE  TRUE
#  [52]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE
#  [69] FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
#  [86] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE

imdb %>%
    select(movie_name, genre, rating) %>%
    filter(grepl("Drama", imdb$genre))
#                                           movie_name                       genre    rating
# 1                           The Shawshank Redemption                       Drama         R
# 2                                      The Godfather                Crime, Drama         R
# 3                                    The Dark Knight        Action, Crime, Drama     PG-13
# 4                             The Godfather: Part II                Crime, Drama         R
# ...

############################################
## Create New Colunms

imdb %>%
    select(movie_name, score, length) %>%
    mutate(score_group = if_else(score >= 9, "High Rating", "Low Rating"),
           length_group = if_else(length >= 120, "Long Film", "Short Film"))
#                                                               movie_name score length score_group length_group
# 1                                               The Shawshank Redemption   9.3    142 High Rating    Long Film
# 2                                                          The Godfather   9.2    175 High Rating    Long Film
# 3                                                        The Dark Knight   9.0    152 High Rating    Long Film
# 4                                                 The Godfather: Part II   9.0    202 High Rating    Long Film
# ...

imdb %>%
    select(movie_name, score) %>%
    mutate(score_update = score + 0.1) %>%
    head(4)
#                 movie_name score score_update
# 1 The Shawshank Redemption   9.3          9.4
# 2            The Godfather   9.2          9.3
# 3          The Dark Knight   9.0          9.1
# 4   The Godfather: Part II   9.0          9.1

# เขียนตัวอัพเดทของ column ทับ column เดิมก็ได้
imdb %>%
  select(movie_name, score) %>%
  mutate(score = score + 0.1) %>%
  head(4)

############################################
## Arrange Data

head(imdb, 4)
#   no               movie_name year rating length                genre score
# 1  1 The Shawshank Redemption 1994      R    142                Drama   9.3
# 2  2            The Godfather 1972      R    175         Crime, Drama   9.2
# 3  3          The Dark Knight 2008  PG-13    152 Action, Crime, Drama   9.0
# 4  4   The Godfather: Part II 1974      R    202         Crime, Drama   9.0

# ASC order
imdb %>%
    arrange(length) %>%
    head(4)
#   no     movie_name year   rating length                       genre score
# 1 52   Modern Times 1936        G     87       Comedy, Drama, Family   8.5
# 2 53    City Lights 1931        G     87      Comedy, Drama, Romance   8.5
# 3 43  The Lion King 1994        G     88 Animation, Adventure, Drama   8.5
# 4 79 Paths of Glory 1957 Approved     88                  Drama, War   8.4

# DESC order
imdb %>%
    arrange(desc(length)) %>%
    head(4)
#   no                                    movie_name year    rating length                    genre score
# 1 71                   Once Upon a Time in America 1984         R    229             Crime, Drama   8.4
# 2 31                                 Seven Samurai 1954 Not Rated    207 Action, Adventure, Drama   8.6
# 3  4                        The Godfather: Part II 1974         R    202             Crime, Drama   9.0
# 4  5 The Lord of the Rings: The Return of the King 2003     PG-13    201 Action, Adventure, Drama   8.9

# Multiple cplumns
imdb %>%
    arrange(genre, desc(length)) %>%
    head(4)
#   no                                    movie_name year    rating length                    genre score
# 1 63                         The Dark Knight Rises 2012     PG-13    164        Action, Adventure   8.4
# 2 72                       Raiders of the Lost Ark 1981        PG    115        Action, Adventure   8.4
# 3 31                                 Seven Samurai 1954 Not Rated    207 Action, Adventure, Drama   8.6
# 4  5 The Lord of the Rings: The Return of the King 2003     PG-13    201 Action, Adventure, Drama   8.9

############################################
## Summary Statistics

# ใช้ summarize() และ group_by() ทำงานด้วยกัน

# หาความยาวหนังเฉลี่ย
imdb %>%
    summarize(mean_length = mean(length))
#   summarize(mean_length = mean(length))
# mean_length1      134.54

imdb %>%
    summarize(mean_length = mean(length),
              sum_length = sum(length),
              sd_length = sd(length),
              min_length = min(length),
              max_length = max(length),
              n = n())
#   mean_length sum_length sd_length min_length max_length   n
# 1      134.54      13454  29.35379         87        229 100

imdb %>%
    group_by(rating) %>%
    summarize(mean_length = mean(length),
              sum_length = sum(length),
              sd_length = sd(length),
              min_length = min(length),
              max_length = max(length),
              n = n())
#   rating      mean_length sum_length sd_length min_length max_length     n
#   <chr>             <dbl>      <int>     <dbl>      <int>      <int> <int>
# 1 ""                123          369     10.1         112        132     3
# 2 "Approved"        100          300     14.4          88        116     3
# 3 "G"                92.6        463      7.44         87        103     5
# 4 "Not Rated"       140.        1396     32.7          89        207    10
# 5 "PG"              118.        1533     17.3          95        165    13
# 6 "PG-13"           157.        2661     22.9         116        201    17
# 7 "Passed"          118.         235     10.6         110        125     2
# 8 "R"               138.        6497     28.3         102        229    47

imdb %>%
    filter(rating != "") %>%
    group_by(rating) %>%
    summarize(mean_length = mean(length),
              sum_length = sum(length),
              sd_length = sd(length),
              min_length = min(length),
              max_length = max(length),
              n = n())
# # A tibble: 7 × 7
#   rating    mean_length sum_length sd_length min_length max_length     n
#   <chr>           <dbl>      <int>     <dbl>      <int>      <int> <int>
# 1 Approved        100          300     14.4          88        116     3
# 2 G                92.6        463      7.44         87        103     5
# 3 Not Rated       140.        1396     32.7          89        207    10
# 4 PG              118.        1533     17.3          95        165    13
# 5 PG-13           157.        2661     22.9         116        201    17
# 6 Passed          118.         235     10.6         110        125     2
# 7 R               138.        6497     28.3         102        229    47

############################################
## Join Tables

# สร้าง dataframe เก็บหนังที่ชอบ (เก็บเฉพาะ index)
(favourite_films <- data.frame(id = c(5, 10, 25, 30, 98)))
#   id
# 1  5
# 2 10
# 3 25
# 4 30
# 5 98

favourite_films %>%
    inner_join(imdb, by = c("id" = "no"))
#   id                                    movie_name year    rating length                    genre score
# 1  5 The Lord of the Rings: The Return of the King 2003     PG-13    201 Action, Adventure, Drama   8.9
# 2 10                                    Fight Club 1999         R    139                    Drama   8.8
# 3 25                                The Green Mile 1999         R    189    Crime, Drama, Fantasy   8.6
# 4 30                                      Harakiri 1962 Not Rated    133   Action, Drama, Mystery   8.6
# 5 98                           Requiem for a Dream 2000         R    102                    Drama   8.3

############################################
## Export CSV File

## write csv file (export result)
imdb_prep <- imdb %>%
    select(movie_name, released_year = year, rating, length, score) %>%
    filter(rating == "R" & released_year > 2000)
#                               movie_name released_year rating length score
# 1                               Parasite          2019      R    132   8.6
# 2                            City of God          2002      R    130   8.6
# 3                                  Joker          2019      R    122   8.5
# 4                               Whiplash          2014      R    106   8.5
# 5                       The Intouchables          2011      R    112   8.5
# 6                           The Departed          2006      R    151   8.5
# 7                            The Pianist          2002      R    150   8.5
# 8                             Capharnaüm          2018      R    126   8.4
# 9                       Django Unchained          2012      R    165   8.4
# 10                   The Lives of Others          2006      R    137   8.4
# 11                                Oldboy          2003      R    120   8.4
# 12                                  1917          2019      R    119   8.3
# 13                              The Hunt          2012      R    115   8.3
# 14                             Incendies          2010      R    131   8.3
# 15                  Inglourious Basterds          2009      R    153   8.3
# 16 Eternal Sunshine of the Spotless Mind          2004      R    108   8.3
# 17                                Amélie          2001      R    122   8.3

# export file into working directory
write.csv(imdb_prep, "imdb_prep.csv", row.names = FALSE)

############################################
############################################
# [INTERMEDIATE]

## Tibble

df_tibble <- tibble(id = 1:3, name = c("toy", "jisoo", "lisa"))
# # A tibble: 3 × 2
#      id name
#   <int> <chr>
# 1     1 toy
# 2     2 jisoo
# 3     3 lisa

df <- data.frame(id = 1:3, name = c("toy", "jisoo", "lisa"))
#   id  name
# 1  1   toy
# 2  2 jisoo
# 3  3  lisa

class(df_tibble)
# [1] "tbl_df"     "tbl"        "data.frame"
class(df)
# [1] "data.frame"

# convert dataframe to tibble
(mtcars_tibble <- tibble(mtcars))
# # A tibble: 32 × 11
#      mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
#    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#  1  21       6  160    110  3.9   2.62  16.5     0     1     4     4
#  2  21       6  160    110  3.9   2.88  17.0     0     1     4     4
#  3  22.8     4  108     93  3.85  2.32  18.6     1     1     4     1
#  4  21.4     6  258    110  3.08  3.22  19.4     1     0     3     1
#  5  18.7     8  360    175  3.15  3.44  17.0     0     0     3     2
#  6  18.1     6  225    105  2.76  3.46  20.2     1     0     3     1
#  7  14.3     8  360    245  3.21  3.57  15.8     0     0     3     4
#  8  24.4     4  147.    62  3.69  3.19  20       1     0     4     2
#  9  22.8     4  141.    95  3.92  3.15  22.9     1     0     4     2
# 10  19.2     6  168.   123  3.92  3.44  18.3     1     0     4     4
# # … with 22 more rows
# # ℹ Use `print(n = ...)` to see more rows

############################################

## Sample Data

# สุ่มรถจำนวน 5 คัน - ทุกครั้งที่สุ่ม ผลลัพธ์จะเปลี่ยนไปเรื่อยๆ
sample_n(mtcars, size=5)
#                   mpg cyl  disp  hp drat    wt  qsec vs am gear carb
# Duster 360       14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
# Porsche 914-2    26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
# Pontiac Firebird 19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
# AMC Javelin      15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
# Fiat 128         32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1

# ถ้าต้องการ lock ผลลัพธ์
set.seed(42)
sample_n(mtcars, size=5)
#                    mpg cyl  disp  hp drat    wt  qsec vs am gear carb
# Chrysler Imperial 14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
# Hornet Sportabout 18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
# Mazda RX4         21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
# Pontiac Firebird  19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
# Merc 280          19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4

set.seed(34)
sample_n(mtcars, size=5)

# สุ่มตัวอย่าง 20% จาก dataframe
sample_frac(mtcars, size=0.20)
#                      mpg cyl  disp  hp drat    wt  qsec vs am gear carb
# Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
# Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
# Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
# Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
# Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
# Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4

# ถ้าต้องการให้ผลลัพธ์ออกมาซ้ำกันได้ด้วย - ใช้ replace=TRUE
sample_frac(mtcars, size=0.20, replace=T)
#                      mpg cyl  disp  hp drat    wt  qsec vs am gear carb
# Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
# Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
# Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
# Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
# Ford Pantera L...5  15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
# Ford Pantera L...6  15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4

############################################

## Slice

mtcars %>%
    slice(1:5)
#                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
# Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
# Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
# Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
# Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
# Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2

mtcars %>%
    slice(6:9)
#             mpg cyl  disp  hp drat   wt  qsec vs am gear carb
# Valiant    18.1   6 225.0 105 2.76 3.46 20.22  1  0    3    1
# Duster 360 14.3   8 360.0 245 3.21 3.57 15.84  0  0    3    4
# Merc 240D  24.4   4 146.7  62 3.69 3.19 20.00  1  0    4    2
# Merc 230   22.8   4 140.8  95 3.92 3.15 22.90  1  0    4    2

mtcars %>%
    slice(c(1,3,5))
#                    mpg cyl disp  hp drat   wt  qsec vs am gear carb
# Mazda RX4         21.0   6  160 110 3.90 2.62 16.46  0  1    4    4
# Datsun 710        22.8   4  108  93 3.85 2.32 18.61  1  1    4    1
# Hornet Sportabout 18.7   8  360 175 3.15 3.44 17.02  0  0    3    2

sample(99, 4)
# [1] 67 43 20 33

mtcars %>%
    slice(sample(nrow(mtcars), 4))


