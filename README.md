# Getting-and-Cleaning-Data-Course-Project

# The script first reads in the test and training sets, along with their respective corresponding subjects and activities. The subjects and activities are then merged with the main set using cbind(). The two sets are then combined into one dataset using rbind()

# The script then extracts the mean and standard deviation columns, before replacing the activity labels with their corresponding description. Next, the script names the columns using the features.txt file.

# Lastly, the script creates a new dataset that records the mean of each column for each combination of subject and activity
