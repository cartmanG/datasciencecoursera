{\rtf1\ansi\ansicpg1252\cocoartf1404\cocoasubrtf110
{\fonttbl\f0\fnil\fcharset0 HelveticaNeue;\f1\fnil\fcharset0 Consolas;}
{\colortbl;\red255\green255\blue255;\red38\green38\blue38;}
{\*\listtable{\list\listtemplateid1\listhybrid{\listlevel\levelnfc23\levelnfcn23\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{disc\}}{\leveltext\leveltemplateid1\'01\uc0\u8226 ;}{\levelnumbers;}\fi-360\li720\lin720 }{\listname ;}\listid1}
{\list\listtemplateid2\listhybrid{\listlevel\levelnfc23\levelnfcn23\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{disc\}}{\leveltext\leveltemplateid101\'01\uc0\u8226 ;}{\levelnumbers;}\fi-360\li720\lin720 }{\listname ;}\listid2}}
{\*\listoverridetable{\listoverride\listid1\listoverridecount0\ls1}{\listoverride\listid2\listoverridecount0\ls2}}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\b\fs72 \cf2 \expnd0\expndtw0\kerning0
Introduction\
\pard\pardeftab720\partightenfactor0

\b0\fs32 \cf2 The script 
\f1\fs28 \cb0 run_analysis.R 
\f0\fs32 \cb1 performs the 5 steps described in the course project's definition.\
\pard\tx220\tx720\pardeftab720\li720\fi-720\partightenfactor0
\ls1\ilvl0\cf2 \kerning1\expnd0\expndtw0 {\listtext	\'95	}\expnd0\expndtw0\kerning0
First, all the similar data is merged using the 
\f1\fs28 \cb0 rbind()
\f0\fs32 \cb1  function. By similar, we address those files having the same number of columns and referring to the same entities.\
\ls1\ilvl0\kerning1\expnd0\expndtw0 {\listtext	\'95	}\expnd0\expndtw0\kerning0
Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from 
\f1\fs28 \cb0 features.txt
\f0\fs32 \cb1 .\
\ls1\ilvl0\kerning1\expnd0\expndtw0 {\listtext	\'95	}\expnd0\expndtw0\kerning0
As activity data is addressed with values 1:6, we take the activity names and IDs from 
\f1\fs28 \cb0 activity_labels.txt
\f0\fs32 \cb1  and they are substituted in the dataset.\
\ls1\ilvl0\kerning1\expnd0\expndtw0 {\listtext	\'95	}\expnd0\expndtw0\kerning0
On the whole dataset, those columns with vague column names are corrected.\
\ls1\ilvl0\kerning1\expnd0\expndtw0 {\listtext	\'95	}\expnd0\expndtw0\kerning0
Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called 
\f1\fs28 \cb0 averages_data.txt
\f0\fs32 \cb1 , and uploaded to this repository.\
\pard\pardeftab720\partightenfactor0

\b\fs72 \cf2 Variables\
\pard\tx220\tx720\pardeftab720\li720\fi-720\partightenfactor0
\ls2\ilvl0
\f1\b0\fs28 \cf2 \cb0 \kerning1\expnd0\expndtw0 {\listtext	\'95	}\expnd0\expndtw0\kerning0
x_train
\f0\fs32 \cb1 , 
\f1\fs28 \cb0 y_train
\f0\fs32 \cb1 , 
\f1\fs28 \cb0 x_test
\f0\fs32 \cb1 , 
\f1\fs28 \cb0 y_test
\f0\fs32 \cb1 , 
\f1\fs28 \cb0 subject_train
\f0\fs32 \cb1  and 
\f1\fs28 \cb0 subject_test
\f0\fs32 \cb1  contain the data from the downloaded files.\
\ls2\ilvl0
\f1\fs28 \cb0 \kerning1\expnd0\expndtw0 {\listtext	\'95	}\expnd0\expndtw0\kerning0
x_data
\f0\fs32 \cb1 , 
\f1\fs28 \cb0 y_data
\f0\fs32 \cb1  and 
\f1\fs28 \cb0 subject_data
\f0\fs32 \cb1  merge the previous datasets to further analysis.\
\ls2\ilvl0
\f1\fs28 \cb0 \kerning1\expnd0\expndtw0 {\listtext	\'95	}\expnd0\expndtw0\kerning0
features
\f0\fs32 \cb1  contains the correct names for the 
\f1\fs28 \cb0 x_data
\f0\fs32 \cb1  dataset, which are applied to the column names stored in 
\f1\fs28 \cb0 mean_and_std_features
\f0\fs32 \cb1 , a numeric vector used to extract the desired data.\
\pard\tx220\tx720\pardeftab720\li720\fi-720\partightenfactor0
\ls2\ilvl0\cf2 \kerning1\expnd0\expndtw0 {\listtext	\'95	}\expnd0\expndtw0\kerning0
A similar approach is taken with activity names through the 
\f1\fs28 \cb0 activities
\f0\fs32 \cb1  variable.\
\pard\tx220\tx720\pardeftab720\li720\fi-720\partightenfactor0
\ls2\ilvl0
\f1\fs28 \cf2 \cb0 \kerning1\expnd0\expndtw0 {\listtext	\'95	}\expnd0\expndtw0\kerning0
all_data
\f0\fs32 \cb1  merges 
\f1\fs28 \cb0 x_data
\f0\fs32 \cb1 , 
\f1\fs28 \cb0 y_data
\f0\fs32 \cb1  and 
\f1\fs28 \cb0 subject_data
\f0\fs32 \cb1  in a big dataset.\
\pard\tx220\tx720\pardeftab720\li720\fi-720\partightenfactor0
\ls2\ilvl0\cf2 \kerning1\expnd0\expndtw0 {\listtext	\'95	}\expnd0\expndtw0\kerning0
Finally, 
\f1\fs28 \cb0 averages_data
\f0\fs32 \cb1  contains the relevant averages which will be later stored in a 
\f1\fs28 \cb0 .txt
\f0\fs32 \cb1  file. 
\f1\fs28 \cb0 ddply()
\f0\fs32 \cb1  from the plyr package is used to apply 
\f1\fs28 \cb0 colMeans()
\f0\fs32 \cb1  and ease the development.}