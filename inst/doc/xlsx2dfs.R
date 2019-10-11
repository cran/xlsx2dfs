## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

#devtools::use_mit_license()

## ----examples------------------------------------------------------------
#devtools::load_all()
library(xlsx2dfs)
df1 <- data.frame(genes = c("gene1", "gene2"),
                  count = c(23,  50))
df2 <- data.frame(genes = c("gene3", "gene4"),
                  count = c(100, 500))
# write one data frame on one sheet
dfs2xlsx(withNames("first sheet", df1), "../inst/extdata/test_one_df.xlsx")

# write more data frames into one file
dfs2xlsx(withNames("first data frame", df1,
                   "second data frame", df2), "../inst/extdata/test_two_dfs.xlsx")

# or create a data frame list with the desired names
# and print into xlsx file
df.list <- list(`first data frame`=df1,
                `second data frame`=df2)
# actually "withNames()" is superfluous ...
dfs2xlsx(df.list, "../inst/extdata/test_two_dfs1.xlsx")

# write one data frame into a file
dfs2xlsx(list(`one data frame`=df1),
         "../inst/extdata/one_df.xlsx")

# read-in excel file as a data frame list
dfs.list <- xlsx2dfs("../inst/extdata/test_two_dfs1.xlsx")

