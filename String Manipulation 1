#rstudio API
setwd("C:/Users/Admin/Documents/R/Data")

library(stringi)

#Data Import 
citations <- readLines("citations.txt")
citations_txt <- citations[!stri_isempty(citations)]
sum(stri_isempty(citations)) 

# Data Cleaning 
library(tidyverse)
library(rebus)
library(lubridate)
sample(citations_txt, 10)
citations_tbl <- tibble(line=1:length(citations_txt), cites=citations_txt) %>%
  mutate(cites=str_replace_all(cites, UP_QUOTATION_MARK, "")) %>% 
  mutate(year = as.numeric(str_match(cites, OPEN_PAREN %R% capture(repeated(DGT, 4)))[,2])) %>%
  mutate(page_start = as.numeric(str_match(cites, capture(one_or_more(DGT)) %R% "-" %R% one_or_more(DGT))[,2])) %>%
  mutate(perf_ref= str_detect(regex(cites, case_insensitive=TRUE), pattern="perform")) %>%
  mutate(title = str_match(cites, CLOSE_PAREN %R% DOT %R% (SPACE) %R% 
                             capture(one_or_more(negated_char_class(DOT))))[,2]) %>% 
  mutate(first_author= str_match(cites, START %R% 
                                   capture(one_or_more(WRD) %R% "," %R% SPACE %R% (WRD) %R% optional(DOT) %R% optional(SPACE) %R% optional(WRD)))[,2])
  
=
         
