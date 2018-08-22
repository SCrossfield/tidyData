
run_analysis.R contains the following four variables:

1. 
Name: activityLabel

Storage mode: integer

Factor with 6 levels

Description: activity performed while the measurement was taken. 

Values and labels: 1 walking, 2 walking upstairs, 3 walking downstairs, 4 sitting, 5 standing, 6 laying.

2. 
Name: subjectID

Storage mode: integer

Description: unique ID per subject

Values: 1-30 (30 subjects)

3.
Name: variable

Storage mode: character

Description: variable measured (see below for further detail on each value and its unit of measurement)

Values: 1	frequencyBodyAccJerkMeanX

2	frequencyBodyAccJerkMeanY

3	frequencyBodyAccJerkMeanZ

4	frequencyBodyAccJerkStdX

5	frequencyBodyAccJerkStdY

6	frequencyBodyAccJerkStdZ

7	frequencyBodyAccMagMean

8	frequencyBodyAccMagStd

9	frequencyBodyAccMeanX

10	frequencyBodyAccMeanY

11	frequencyBodyAccMeanZ

12	frequencyBodyAccStdX

13	frequencyBodyAccStdY

14	frequencyBodyAccStdZ

15	frequencyBodyBodyAccJerkMagMean

16	frequencyBodyBodyAccJerkMagStd

17	frequencyBodyBodyGyroJerkMagMean

18	frequencyBodyBodyGyroJerkMagStd

19	frequencyBodyBodyGyroMagMean

20	frequencyBodyBodyGyroMagStd

21	frequencyBodyGyroMeanX

22	frequencyBodyGyroMeanY

23	frequencyBodyGyroMeanZ

24	frequencyBodyGyroStdX

25	frequencyBodyGyroStdY

26	frequencyBodyGyroStdZ

27	timeBodyAccJerkMagMean

28	timeBodyAccJerkMagStd

29	timeBodyAccJerkMeanX

30	timeBodyAccJerkMeanY

31	timeBodyAccJerkMeanZ

32	timeBodyAccJerkStdX

33	timeBodyAccJerkStdY

34	timeBodyAccJerkStdZ

35	timeBodyAccMagMean

36	timeBodyAccMagStd

37	timeBodyAccMeanX

38	timeBodyAccMeanY

39	timeBodyAccMeanZ

40	timeBodyAccStdX

41	timeBodyAccStdY

42	timeBodyAccStdZ

43	timeBodyGyroJerkMagMean

44	timeBodyGyroJerkMagStd

45	timeBodyGyroJerkMeanX

46	timeBodyGyroJerkMeanY

47	timeBodyGyroJerkMeanZ

48	timeBodyGyroJerkStdX

49	timeBodyGyroJerkStdY

50	timeBodyGyroJerkStdZ

51	timeBodyGyroMagMean

52	timeBodyGyroMagStd

53	timeBodyGyroMeanX

54	timeBodyGyroMeanY

55	timeBodyGyroMeanZ

56	timeBodyGyroStdX

57	timeBodyGyroStdY

58	timeBodyGyroStdZ

59	timeGravityAccMagMean

60	timeGravityAccMagStd

61	timeGravityAccMeanX

62	timeGravityAccMeanY

63	timeGravityAccMeanZ

64	timeGravityAccStdX

65	timeGravityAccStdY

66	timeGravityAccStdZ

4.
Name: mean

Storage mode: double

Description: mean of the variable, per activity and subject

Min.: -0.998

Max.: 0.975


Further detail on the variable names and their unit of measurement is printed below. This is sourced from the zip file referenced in the README.md:

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean


