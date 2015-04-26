## Course Project - Getting and Cleaning Data


    #unzip data in the current working directory
    # filepath = full name including path for the zip file
    # Filename = name of the file to unzip contents to
   

    # load dplyr library 
    library(dplyr)
    
   # download source data file
    filepath <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    td <- tempdir()    
    tf = tempfile(tmpdir=td, fileext=".zip")
    download.file(filepath,tf)   # only needed if the file is on the web
    
    dfList <- list()
    filenames <-vector()
    fname <- vector()
    fpath <- vector()
    rawdata <- data.frame()
    filenames <- unzip(tf,list=TRUE)
    
    fileIDs <- c(1,2,16,17,18,30,31,32)  #find these indexes by matching file
    #names wer're looking for
    for (i in seq (along=fileIDs)) {     
        fname[i] = unzip(tf, list=TRUE)$Name[fileIDs[i]]
        unzip(tf, files=fname[i], exdir=td, overwrite=TRUE)
        fpath[i] = file.path(td, fname[i])
        rawdata<-read.table(fpath[i],stringsAsFactors=FALSE)    
        dfList[[i]]<-rawdata
        #print(i);
        print(fname[i]);#print(fileIDs[i])   
    }
    
    
    ## check on whether there's missing data
    #x=colSums(is.na(data17))
    #all(x==0)
    #combine test data sets
    #combineTest <- cbind(data16,data18,data17) 
    combineTest <- cbind(dfList[[3]],dfList[[5]],dfList[[4]])
    combineTrain <- cbind(dfList[[6]],dfList[[8]],dfList[[7]])
    combinedData <- rbind(combineTest,combineTrain)
    #Create column Names
    newNames = c("Subjects","Activities",dfList[[2]][,2])
    colnames(combinedData)<-newNames
    
    #Now only keep names with mean or std 
    indexMean <-grep("mean",names(combinedData))
    indexStd <-grep("std",names(combinedData))
    indexSubAct <- c(1,2)
    indextemp <- c(indexSubAct,indexMean,indexStd)
    index <-sort(indextemp)
    #index <- as.vector(rbind(indexSubAct,index))
    dataFinal <-combinedData[,index]
    
    #  remove columns with variable "meanFreq"
    dataFinal=dataFinal[,-grep("meanFreq",names(dataFinal))]
    


#Clean up the column Names to make readable and understandable
    
    colNames=names(dataFinal)    
    newNames=gsub("()","",colNames,fixed=TRUE)
    newNames=gsub("tBody","TimeBody",newNames,fixed=TRUE)
    newNames=gsub("fBody","FreqBody",newNames,fixed=TRUE)
    newNames=gsub("tGravity","TimeGravity",newNames,fixed=TRUE)
    newNames=gsub("-mean","MEAN",newNames,fixed=TRUE)
    newNames=gsub("-std","SDEV",newNames,fixed=TRUE)
    
    newNames=gsub("-X","_X",newNames,fixed=TRUE)
    newNames=gsub("-Y","_Y",newNames,fixed=TRUE)
    newNames=gsub("-Z","_Z",newNames,fixed=TRUE)
    
    
    #Replace column names of the original dataframe with updated names
    names(dataFinal)=newNames
    
    # then need to average mean and std for each subject and activity
    
    summaryData <-
      dataFinal%>%
      group_by(Subjects,Activities) %>%
      summarise_each(funs(mean,sd))
      View(summaryData)

    # write tidy data set to a file
    write.table(summaryData,file="summary_tidy_data.txt",row.names=FALSE)

    #confirm validity of file:
    check_summary= read.table("summary_tidy_data.txt", header=TRUE)

    # write column names of tidy data set to a file for code-book editing
    write.table(names(summaryData),file="code_book_tidy.txt",row.names=FALSE)
    