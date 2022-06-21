require_relative '../conway'

describe "#next_generation" do
	
	it 'returns block live cells given block of live cells' do
		expect(next_generation([[:alive,:alive],[:alive,:alive]])).
		to eq([[:alive,:alive],[:alive,:alive]])
	end

	it 'returns blinker(p2) given blinker(p1)' do
		expect(next_generation([[:dead,:alive,:dead] * 3])).
		to eq([[:dead] * 3,[:alive] * 3, [:dead] * 3])
	end

	it 'returns blinker(p1) given blinker(p2)' do
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
end