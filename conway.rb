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

	[neighbour_one,neighbour_two].select { |e| e != nil  }

end
