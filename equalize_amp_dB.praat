# This script takes all the files in the specified directory, modify their intensity in dB, and writes new files to a new folder. It takes three arguments: InputDir is the original folder; OutputDir is a new folder in which the modified files are stored; dB is a dB value to which you want your files to be modified to.
# version 4/7/2009

#Ensure you enter the correct directory for the files that will be read in, and the directory for where the files will be saved. Also remember the a slash at the end of the directories.

form Files
	sentence InputDir /Users/pmonahan/Desktop/soundfiles/spliced/
	sentence OutputDir /Users/pmonahan/Desktop/soundfiles/spliced/amp/
positive dB 70
endform

# this lists everything in the directory into what's called a Strings list
# and counts how many there are

Create Strings as file list... list 'inputDir$'*.wav
numberOfFiles = Get number of strings

# then it loops through, doing some actions for every file in the list

for ifile to numberOfFiles

	# opens each file, one at a time

	select Strings list
	fileName$ = Get string... ifile
	Read from file... 'inputDir$''fileName$'

	# and scales peak and write to a new wav file

	Scale intensity... 'dB'
	Write to WAV file... 'outputDir$''fileName$'

	# then remove all the objects except the strings list so praat isn't all cluttered up

	select all
	minus Strings list
	Remove

endfor

# at the very end, remove any other objects sitting around - like the strings list

select all
Remove
