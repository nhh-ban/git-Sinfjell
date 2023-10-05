galaxy_data <- read.csv("galaxy_data.csv", stringsAsFactors = FALSE)

# Summary statistics
summary(galaxy_data$a_26)

# Histogram
ggplot(galaxy_data, aes(x = a_26)) +
  geom_histogram(binwidth = 1, fill = "blue", alpha = 0.7) +
  ggtitle("Distribution of Galaxy Sizes") +
  xlab("Linear Diameter (kpc)") +
  ylab("Frequency")

# Density Plot
ggplot(galaxy_data, aes(x = a_26)) +
  geom_density(fill = "blue", alpha = 0.7) +
  ggtitle("Density Plot of Galaxy Sizes") +
  xlab("Linear Diameter (kpc)") +
  ylab("Density")

# hmmm, our plots and histogram are showing that smaller objects are over represented