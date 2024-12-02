library(tidyverse)
path <- "yourpathhere"
correct <- 0
# Read all lines from the file once
lines <- readLines(path)
#check conditions

check_cond_func <- function(numbers) {
  differences <- diff(numbers)
  cond_1 <- (all(differences > 0) || all(differences < 0))
  if (cond_1 == FALSE) {
    return(FALSE)
  } else {
    differences <- abs(differences)
    cond_2 <- (any(differences < 1) || any(differences > 3))
    if (cond_2 == TRUE) {
      return(FALSE)
    } else {
      return(TRUE)
    }
  }
}

# Loop through each line
for (i in seq_along(lines)) {
  line <- lines[i]
  line <- as.numeric(unlist(strsplit(line, " ")))
  if (check_cond_func(line) == TRUE) {
    correct <- correct +1
  }
  else {
    for (j in seq(1, length(line), by=1)) {
      temp_line <- line[-j]
      if (check_cond_func(temp_line) == TRUE) {
        correct <- correct + 1
        break
      }
    }
  }
}
print(correct)

