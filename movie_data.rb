#movie_data.rb

#Begin parsing movie data



def parse_movies(movie_array)

	movie_raw_data = File.new("u.item", "r")

	i = 0

	#This array holds the array returned by splitting each line of the file
	temp_arr = []

	cur_line = movie_raw_data.gets

	
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

		movie_array[i][5] = 0

		movie_array[i][6] = 0
		
		#This while loop puts each of the "tags" into an array together such that all tags make-up one element
		#of the movie's array
		while rem < temp_arr.size

			movie_array[i][3][count] = temp_arr[rem].to_i

			count += 1

			rem += 1

		end

		cur_line = movie_raw_data.gets

		i += 1

	end

	return movie_array

end


#End parsing movie data


















#Begin parsing review data



def parse_reviews(movie_array,user_array)

	review_raw_data = File.new("BLABLA", "r")

	temp_arr = Array.new

	cur_line = review_raw_data.gets

	while cur_line

		temp_arr = cur_line.split

		#This does not work
		temp_arr.map {|el| el.to_i}


		#If the user's array is empty, intialize
		if !(user_array[temp_arr[0]])

			user_array[temp_arr[0]] = Array.new

			user_array[0][0] = Array.new(2)

			user_array[0][1] = Array.new(2, Array.new)

			user_array[0][0][0] = Array.new(18, 0)

			user_array[0][0][1] = Array.new(18, 0)

		end

		tag_arr = movie_array[temp_arr[1]][3]

		i = 0


		#Add movie's tags to user's tag list
		while i <= 17

			user_array[temp_arr[0]][0][0][i] +=  tag_arr[i]

			i += 1

		end



		user_array[temp_arr[0]][1][0] << temp_arr[1] #add movie to user's list of movies

		user_array[temp_arr[0]][1][1] << temp_arr[2] #add rating to user's list of ratings

		movie_array[temp_arr[1]][4][0] <<temp_arr[3]

		movie_array[temp_arr[1]][4][1] << temp_arr[2]

		movie_array[temp_arr[1]][5] += 1 #increment views

		movie_array[temp_arr[1]][4][1].each { |el| movies[temp_arr[1]][6] += el }

		movie_array[temp_arr[1]][6] /= movies[temp_arr[1]][5]


end









def compute_proportions(user)

	total = 0

	user[0][0].each {|el| total += el}

	i = 0

	while i <= 17

		user[0][1][i] = user[0][0][i] / total

		i += 1

	end

end







def load_data(movie_array, user_array)

	parse_movies(movie_array)

end






def popularity_list_views(movie_array)

	movie_array.sort_by {|x| x[5] }

end





def popularity_list_views(movie_array)

	movie_array.sort_by { |x| x[6] }

end



def similarity(user1, user2)

	compute_proportions(user1)

	compute_proportions(user2)

	i = 0

	x = 0

	while i <= 17

		x += (user1[0][0][i] - user2[0][0][i]).abs


	end


	return x

end
 







