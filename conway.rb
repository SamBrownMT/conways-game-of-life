def next_generation(grid)
	# if input == [[:dead,:alive,:dead] * 3]
	# 	return [[:dead] * 3,[:alive] * 3, [:dead] * 3]
	# elsif input == [[:dead] * 3,[:alive] * 3, [:dead] * 3]
	# 	return [[:dead,:alive,:dead] * 3]
	# else
	# 	input
	# end

	output = Array.new(grid.length) {Array.new(grid[0].length)}

	zero_zero_neighbours = find_neighbours(grid,[0,0])
	zero_zero_new_status = set_cell_status(grid[0][0],zero_zero_neighbours)
	output[0][0] = zero_zero_new_status

	zero_one_neighbours = find_neighbours(grid,[0,1])
	zero_one_new_status = set_cell_status(grid[0][1],zero_one_neighbours)
	output[0][1] = zero_one_new_status

	one_zero_neighbours = find_neighbours(grid,[1,0])
	one_zero_new_status = set_cell_status(grid[1][0],one_zero_neighbours)
	output[1][0] = one_zero_new_status

	one_one_neighbours = find_neighbours(grid,[1,1])
	one_one_new_status = set_cell_status(grid[1][1],one_one_neighbours)
	output[1][1] = one_one_new_status

	output

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

def set_cell_status(current_status,neighbours)

	if current_status == :alive
		if neighbours.count(:alive) < 2 || neighbours.count(:alive) > 3 
			return :dead
		else return :alive
		end
	else
		return neighbours.count(:alive) == 3 ? :alive : :dead
	end

end
