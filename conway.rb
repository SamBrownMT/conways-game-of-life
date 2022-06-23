
class ConwayGame

	attr_accessor :grid
	
	def initialize(grid)
		@grid = grid
	end

	def next_generation(grid)

		output = Array.new(grid.length) {Array.new(grid[0].length)}

		output.each_index { |row| 
			column = 0
			while column < grid[0].length 
				neighbours = find_neighbours(grid,[row,column])
				new_status = set_cell_status(grid[row][column],neighbours)
				output[row][column] = new_status
				column += 1
			end
		}

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
end
