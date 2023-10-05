# Step 1: Read the entire data file into memory using the readLines()
file_content <- readLines("http://www.sao.ru/lv/lvgdb/article/suites_dw_Table1.txt")

# Step 2: Identify the separator line
separator_line <- grep("-----+----+----", file_content)

# Step 3: Save the variable descriptions in a text-file for future reference
cat(file_content[1:(separator_line - 2)], file = "variable_descriptions.txt", sep = "\n")

# Step 4: Extract the variable names and store them in a vector
variable_names <- strsplit(file_content[separator_line - 1], "\\|")[[1]]
variable_names <- trimws(variable_names) # Remove leading and trailing whitespaces

# Step 5: Rewrite the data to a new .csv-file with comma-separators
# Create header line by collapsing the variable names vector to a single string with commas as separators
header_line <- paste(variable_names, collapse = ",")
# Create data lines by replacing the pipe characters with commas
data_lines <- gsub("\\|", ",", file_content[(separator_line + 1):length(file_content)])
# Combine the header and data lines and write to a new .csv file
cat(c(header_line, data_lines), file = "galaxy_data.csv", sep = "\n")

# Step 6: Read the finished .csv back into R in the normal way
galaxy_data <- read.csv("galaxy_data.csv", stringsAsFactors = FALSE)

# Display the first few rows to confirm
head(galaxy_data)
summary(galaxy_data)
