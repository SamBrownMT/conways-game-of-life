def next_generation(input)
	if input == [[:dead,:alive,:dead] * 3]
		return [[:dead] * 3,[:alive] * 3, [:dead] * 3]
	elsif input == [[:dead] * 3,[:alive] * 3, [:dead] * 3]
		return [[:dead,:alive,:dead] * 3]
	else
		input
	end

end

def find_neighbours(grid,coords)

	
	neighbour_one = grid[coords[0]][coords[1] + 1]
	unless coords[1] == 0
		neighbour_two = grid[coords[0]][coords[1] - 1]
	end

	if grid.length > 1 && coords[0] < grid.length - 1
		neighbour_three = grid[coords[0] + 1][coords[1]]
		neighbour_four = grid[coords[0] + 1][coords[1] + 1]
	end

	unless coords[0] == 0
		neighbour_five = grid[coords[0] - 1][coords[1]]
		neighbour_six = grid[coords[0] - 1][coords[1] + 1]
	end

	unless coords[0] == 0 || coords[1] == 0
		neighbour_seven = grid[coords[0] - 1][coords[1] - 1]
	end

	unless coords[1] == 0 || coords[0] == grid.length - 1
		neighbour_eight = grid[coords[0] + 1][coords[1] - 1]
	end

	[neighbour_one,neighbour_two,neighbour_three,neighbour_four,
		neighbour_five,neighbour_six,neighbour_seven,neighbour_eight].
		select { |e| e != nil  }

end
