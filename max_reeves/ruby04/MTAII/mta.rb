# There are 3 subway lines:
# The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
# The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
# The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.
# All 3 subway lines intersect at Union Square, but there are no other intersection points. (For example, this means the 28th stop on the N line is different than the 28th street stop on the 6 line, so you'll have to differentiate this when you name your stops in the arrays.)
# Tell the user the number of stops AND the stops IN ORDER that they will pass through or change at.
# Hints:

# All lines intercect at Union Square!


n_line = ["Times Square", "34th", "28th.n", "23rd.n", "Union Square", "8th"]
l_line= ["8th", "6th", "Union Square", "3rd", "1st"]
six_line= ["Grand Central", "33rd", "28th.s", "23rd.s", "Union Square", "Astor Place"]

def tripPlanner (first_line, first_stop, last_line, last_stop)
	# if end_stop is on the "firstline", then print all stops from "firststop" to "endstop"
	if  (first_line === last_line)
		first_stop_i = first_line.index(first_stop)
		last_stop_i = first_line.index(last_stop)
		puts first_stop_i
		puts last_stop_i
		puts (first_line[first_stop_i]..first_line[last_stop_i]).to_a
		(first_line[first_stop_i]..first_line[last_stop_i]).to_a.flatten.each do |stop|
			puts stop
		end
	end
end

# 	# else print stops to union square
# 	if  (first_line == n_line && end_stop == "Union Square")
# 		puts n_line[0..4]
# 	end
# 	# then loop through "second_line" array and print stops from union square to "end_stop"
#  	if (first_stop == "Union Square" && second_line == l_line)
# 		l_line[2].each do |numl|
# 			    puts numl
# 	end
# 	if (first_stop == "Union Square" && second_line == six_line)
# 		six_line[4].each do |nums|
# 					puts nums
# 	end
#
# end




# `puts` shows output similar to this:
# "You must travel through the following stops on the N line: 34th, 28th, 23rd, Union Square."


# "Change at Union Square."
# "Your journey continues through the following stops: 23rd, 28th, 33rd."
# "7 stops in total."

tripPlanner(n_line ,"34th", n_line, "8th")
