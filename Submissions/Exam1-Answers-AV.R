# Exam 1 code for NEUR 8790 ########################
# Alex Vargas 10/21/2019 ##########################



# coding question 1 ######################################
# create the following three vectors:
# a vector that consists of values that increase by 1, starting at 1 and ending at 10.
ones <- 1:10
# show vector contents
ones

# a vector that consists of values that increase by 10, starting at 10 and ending at 100.
tens <- seq(10,100,10)
# show vector contents
tens

# a vector that consists of values that increase by 100, starting at 100 and ending at 1000.
hundreds <- seq(100,1000,100)
# show vector contents
hundreds


# coding question 2 #########################################
# the three vectors from question 1 are being combined into a matrix
# named matrix.mults
matrix.mults<-cbind(ones,tens,hundreds)

#show contents
matrix.mults

# coding question 3 #####################################
# changing the value in the first column, third row to 2
matrix.mults[3,1]<-2
# show change
head(matrix.mults)

# coding question 4 and 5 ######################################
# adding the new value in matrix.mults[3,1] to [2,1]
matrix.mults[2,1]<-matrix.mults[3,1]+matrix.mults[2,1]

# result of the above calculation
head(matrix.mults,3)


# coding question 6 #######################################
df.mults<-data.frame(ones,tens,hundreds)
# show result #
df.mults

# coding question 7 #######################################
Cell.Type<-rbind(NA,NA,NA,NA,NA,NA,NA,NA,NA,NA)
# show contents #
Cell.Type

# coding question 8 #####################################
# replacig all rows of NA with string 'pyramidal'
for (row in 1:nrow(Cell.Type)) {
  Cell.Type[row,]<-'pyramidal'
}
# show result #
Cell.Type

# coding question 9 #######################################
Cell.Type<- t(t(rep(c('pyramidal','unipolar'),5)))
# show results ####
Cell.Type

# coding question 10 & 11 ################################
# I did 10 and 11 in the same step
df.mults<-cbind(Cell.Type,df.mults)


# coding question 12 #####################################
dendrite.data<-df.mults
names(dendrite.data)<- c("Cell.Type","Num.Dendrites", "Num.Branches", "Num.Spines")

# coding question 13 #####################################
Spine.Density<-dendrite.data$Num.Spines/dendrite.data$Num.Dendrites
dendrite.data<-cbind(dendrite.data,Spine.Density)


library(dplyr)
# coding question 14 ###################################
dendrite.data<-arrange(dendrite.data,dendrite.data$Cell.Type)
#show results
dendrite.data

# coding question 15 #################################
# average number of branches
aggregate(dendrite.data$Num.Branches, list(dendrite.data$Cell.Type), mean)



# coding question 16 ##########################################
library(ggplot2)
x11()
ggplot()+geom_col(dendrite.data, mapping = aes(x=Cell.Type, y=Num.Spines))+ylab("Number of Spines")+xlab("Cell Type")




# coding question 17 & 8 ###############################
library(reshape2)
# reshaped the data with melt
x11()
ggplot(melt(dendrite.data), aes(x=variable, y=value))+
  geom_boxplot(aes(fill=Cell.Type))+ 
  theme(axis.title.x=element_blank()) + 
  scale_x_discrete(labels = c('Number of Dendrites',
                                             'Number of Branches',
                                             'Number of Spines', 
                                             'Spine Density'))+
  ylab('Count')+  labs(title='Characteristics by Cell Type', fill='Cell Type')


# coding question 19 #################################
library(readr)
ex1_dat<-read_csv('Exam1_Data_File.csv')

# reordering data frame to have all experimental and control data together in data frame
ex1_dat<-select(ex1_dat,Exp.Sample1,Exp.Sample2, Expt.Sample3,Ctrl.Sample1,Ctrl.Sample2,Ctrl.Sample3 ) 
x11()
ggplot()+geom_histogram(data=ex1_dat, aes(x=Exp.Sample1),col="red")+
geom_histogram(data=ex1_dat, aes(x=Exp.Sample2),col="blue")+  labs(title='Distributions of Experimental Samples 1 & 2')
 
# coding question 20 ##################################
x11()
 ggplot()+ geom_density(data=ex1_dat,  aes(rowMeans(ex1_dat[,1:3])), fill="red", alpha=0.5)+ geom_density(data=ex1_dat,  aes(rowMeans(ex1_dat[,4:6])), fill="steel blue", alpha=0.5)+
  xlab(" ")+  labs(title='Each Group\'s Average Distribution')





