#movie_data.rb

#Begin parsing movie data

movie_raw_data = File.new("u.item", "r")

def parse_movies(movie_file)

	#This array will hold all of the data
	movie_array = Array.new

	i = 0

	#This array holds the array returned by splitting each line of the file
	temp_arr = []

	cur_line = movie_file.gets

	
	#This while loop checks to see if the file has ended and then splits the current line (cur_line)
	#and extracts all of the desired data.

	while cur_line

		temp_arr = cur_line.split("|")

		movie_array[i] = Array.new

		movie_array[i][0] = temp_arr[1]

		movie_array[i][1] = temp_arr[2]

		movie_array[i][2] = temp_arr[4]

		rem = 5

		count = 0

		movie_array[i][3] = Array.new

		#This will hold the movie's review data
		movie_array[i][4] = Array.new(2, Array.new)
		
		#This while loop puts each of the "tags" into an array together such that all tags make-up one element
		#of the movie's array
		while rem < temp_arr.size

			movie_array[i][3][count] = temp_arr[rem].to_i

			count += 1

			rem += 1

		end

		cur_line = movie_file.gets

		i += 1

	end

	return movie_array

end


#End parsing movie data

def compute_proportions(user)

	total = 0

	user[0][0].each {|el| total += el}

	i = 0

	while i <= 18

		user[0][1][i] = user[0][0][i] / total

		i += 1

	end

end





#Begin parsing review data


review_raw_data = File.new("BLABLA", "r")

def parse_reviews

	user_array = Array.new

	temp_arr = Array.new

	cur_line = review_raw_data.gets

	while cur_line

		temp_arr = cur_line.split

		temp_arr.each {|el| el.to_i}


		#If the user's array is empty, intialize
		if !(user_array[temp_arr[0]])

			user_array[temp_arr[0]] = Array.new

			user_array[0][0] = Array.new(2, Array.new)

			user_array[0][1] = Array.new(2, Array.new)

			user_array[0][0][0] = Array.new(18, 0)

			user_array[0][0][1] = Array.new(18, 0)

		end

		tag_arr = movies[temp_arr[1]][3]

		i = 0

		while i <= 18

			user_array[temp_arr[0]][0][i] +=  tag_arr[i]

			i += 1

		end






end











movies = parse_movies(movie_raw_data)












