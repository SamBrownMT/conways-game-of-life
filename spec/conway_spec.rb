require_relative '../conway'

describe "#next_generation" do
	
	it 'returns block live cells given block of live cells' do
		expect(next_generation([[:alive,:alive],[:alive,:alive]])).
		to eq([[:alive,:alive],[:alive,:alive]])
	end

	it 'returns blinker(p2) given blinker(p1)' do
		expect(next_generation([[:dead,:alive,:dead],
			[:dead,:alive,:dead],[:dead,:alive,:dead]])).
		to eq([[:dead,:dead,:dead],[:alive,:alive,:alive],
		 [:dead,:dead,:dead]])
	end

	xit 'returns blinker(p1) given blinker(p2)' do
		expect(next_generation([[:dead] * 3,[:alive] * 3, [:dead] * 3])).
		to eq([[:dead,:alive,:dead] * 3])
	end

	xit 'returns toad(p2) given toad(p1)' do
		expect(next_generation([[:dead] * 4,[:dead] + [:alive] * 3, [:alive] * 3 + 
			[:dead],[:dead] * 4])).
		to eq([[:dead,:dead,:alive,:dead]] + [[:alive,:dead,:dead,:alive]] * 2 +
			[[:dead,:alive,:dead,:dead]])
	end

    
end

describe "#find_neighbours" do
	
	it 'returns b for [[a,b]] and 0,0' do 
		expect(find_neighbours([['a','b']],[0,0])).to eq ['b']
	end

	it 'returns a,c for [[a,b,c]] and 0,1' do 
		expect(find_neighbours([['a','b','c']],[0,1])).
		to match_array ['a','c']
	end

	it 'returns b,c,d for [[a,b],[c,d]] and 0,0' do 
		expect(find_neighbours([['a','b'],['c','d']],[0,0])).
		to match_array ['b','c','d']
	end

	it 'returns a,b,d for [[a,b],[c,d]] and 1,0' do 
		expect(find_neighbours([['a','b'],['c','d']],[1,0])).
		to match_array ['a','b','d']
	end

	it 'returns a,b,c for [[a,b],[c,d]] and 1,1' do 
		expect(find_neighbours([['a','b'],['c','d']],[1,1])).
		to match_array ['a','b','c']
	end

	it 'returns a,c,d for [[a,b],[c,d]] and 0,1' do 
		expect(find_neighbours([['a','b'],['c','d']],[0,1])).
		to match_array ['a','c','d']
	end

	it 'returns 1,2,3,4,6,7,8,9 for [[1,2,3],[4,5,6],[7,8,9]] and 1,1' do 
		expect(find_neighbours([[1,2,3],[4,5,6],[7,8,9]],[1,1])).
		to match_array [1,2,3,4,6,7,8,9]
	end

	it 'returns 2,5,6 for [[1,2,3],[4,5,6],[7,8,9]] and 0,2' do 
		expect(find_neighbours([[1,2,3],[4,5,6],[7,8,9]],[0,2])).
		to match_array [2,5,6]
	end
end

describe '#set_cell_status' do 

	it 'returns :alive for :alive and [:alive,:alive,:alive]' do 
		expect(set_cell_status(:alive,[:alive,:alive,:alive])).
		to eq :alive
	end

	it 'returns :dead for :dead and [:dead,:dead,:alive]' do 
		expect(set_cell_status(:dead,[:dead,:dead,:alive])).
		to eq :dead
	end

	it 'returns :dead for :dead and [:dead,:alive,:dead]' do 
		expect(set_cell_status(:dead,[:dead,:alive,:dead])).
		to eq :dead
	end

	it 'returns :alive for :alive [:alive,:alive,:dead]' do 
		expect(set_cell_status(:alive,[:alive,:alive,:dead])).
		to eq :alive
	end

	it 'returns :dead for :dead [:alive,:alive,:dead]' do 
		expect(set_cell_status(:dead,[:alive,:alive,:dead])).
		to eq :dead
	end

	it 'returns :alive for :dead [:alive,:alive,:alive]' do 
		expect(set_cell_status(:dead,[:alive,:alive,:alive])).
		to eq :alive
	end

	it 'returns :dead for :alive [:dead,:dead,:alive]' do 
		expect(set_cell_status(:alive,[:dead,:dead,:alive])).
		to eq :dead
	end

	it 'returns :dead for :alive [:alive,:alive,:alive,:alive]' do 
		expect(set_cell_status(:alive,[:alive,:alive,:alive,:alive])).
		to eq :dead
	end

end