# First file to be pushed to Github
# for R TOpics course

# generate a variable with a string assigned to it

lst<-'I don\'t really remember what we did'

# print the string out
print(lst)

# generate an array of vowels so I can count how many
# I have in my string
vowcat=c('a','e','i','o','u')

#make an empty vector

vowfreq<-vector()

# a for loop that checks for every vowel in my string
 for(var in vowcat) {
   varL <- paste('[^',var,']')
      vow <- nchar(gsub(varL,"",lst))
      vowfreq<-c(vowfreq,vow)
      }

# prints out the counts of each vowel
print(vowfreq)

# make a dataframe out of the counts
# and the vowels I searched for
vowdf<-data.frame(vowfreq,vowcat)

x11()
# plot it all 
plot(vowdf[,2],
     vowdf[,1],
     '--g',
     main="Vowel count", 
     xlab="vowel", ylab="frequency")

