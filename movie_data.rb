#movie_data.rb


movies = []

movie_raw_data = File.new(test.txt)

def parse_movies(movie_file, movie_array)

	i = 0

	temp_arr = []

	cur_line = gets movie_file

	while cur_line

		temp_arr = cur_line.split(|)

		movie_array[i][1] = temp_arr[2]

		movie_array[i][2] = temp_arr[3]

		movie_array[i][3] = temp_arr[5]

		rem = 6

		count = 0

		while rem < temp_arr.size

			movie_array[i][4][count] = temp_arr[rem].to_i

			count += 1

			rem += 1

		end

		cur_line = gets movie_file

	end

end


parse_movies(movie_raw_data, movies).inspect