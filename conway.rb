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

	neighbours = []

	unless coords[0] == grid[0].length
		neighbours.push(grid[coords[0]][coords[1] + 1])
	end

	unless coords[1] == 0
		neighbours.push(grid[coords[0]][coords[1] - 1])
	end

	unless coords[0] == grid.length - 1
		neighbours.push(grid[coords[0] + 1][coords[1]])
		neighbours.push(grid[coords[0] + 1][coords[1] + 1])
	end

	unless coords[0] == 0
		neighbours.push(grid[coords[0] - 1][coords[1]])
		neighbours.push(grid[coords[0] - 1][coords[1] + 1])
	end

	unless coords[0] == 0 || coords[1] == 0
		neighbours.push(grid[coords[0] - 1][coords[1] - 1])
	end

	unless coords[1] == 0 || coords[0] == grid.length - 1
		neighbours.push(grid[coords[0] + 1][coords[1] - 1])
	end

	neighbours.select { |e| e != nil  }

end

def set_cell_status(neighbours)

	return :dead if neighbours == [:dead,:dead,:alive]

	:alive

end
