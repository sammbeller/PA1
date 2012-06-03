#movie_data.rb

movie_raw_data = File.new("test.txt", "r")

def parse_movies(movie_file)

	movie_array = Array.new

	i = 0

	temp_arr = []

	cur_line = movie_file.gets

	while cur_line

		puts cur_line

		temp_arr = cur_line.split("|")

		movie_array[i] = Array.new

		movie_array[i][0] = temp_arr[1]

		movie_array[i][1] = temp_arr[2]

		movie_array[i][2] = temp_arr[4]

		rem = 5

		count = 0

		movie_array[i][3] = Array.new
		
		while rem < temp_arr.size

			movie_array[i][3][count] = temp_arr[rem].to_i

			count += 1

			rem += 1

		end

		cur_line = movie_file.gets

		i += 1

	end

	puts movie_array.inspect

	return movie_array

end


movies = parse_movies(movie_raw_data)

puts "word up"

