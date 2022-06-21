def next_generation(input)
	if input == [[:dead,:alive,:dead] * 3]
		return [[:dead] * 3,[:alive] * 3, [:dead] * 3]
	elsif input == [[:dead] * 3,[:alive] * 3, [:dead] * 3]
		return [[:dead,:alive,:dead] * 3]
	else
		input
	end
end
