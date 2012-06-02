


users = []



def parse_movies(movie_file)

	i = 0

	temp_arr = []

	cur_line = gets movie_file

	while cur_line

		temp_arr = cur_line.split(|)

		users[i][1] = temp_arr[2]

		users[i][2] = temp_arr[3]

		users[i][3] = temp_arr[5]

		next = 4

		rem = 6

		while rem < temp_arr.size

			if temp_arr[rem] = "0"

				users[i][next] = false

			else

				users[i][next] = true

			end

			next += 1

			rem += 1

		end

	end