#!/bin/bash

output_file="Conv_time_N15.txt"
for r in {1..50}
do

	# Get the oldest file in Histograms_checks
	oldest_file_checks=$(ls -t --time=ctime 1L_N15_P15_R${r}/Histograms_checks/* | tail -1)
	oldest_time_checks=$(stat -c %Y "$oldest_file_checks")

	# Get the most recent file in Histograms_final
	recent_file_final=$(ls -t --time=ctime 1L_N15_P15_R${r}/Histograms_final/* | head -1)
	recent_time_final=$(stat -c %Y "$recent_file_final")

	# Calculate the time difference in minutes
	time_diff=$(( ($recent_time_final - $oldest_time_checks)  ))

	#echo "Time delay in seconds: $time_diff"

	echo "$time_diff" >> $output_file
done