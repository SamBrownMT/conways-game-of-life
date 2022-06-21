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

    
end