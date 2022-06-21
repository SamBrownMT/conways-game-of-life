require_relative '../conway'

describe "conway" do
	
	it 'returns block live cells given block of live cells' do
		expect(conway([[:alive,:alive],[:alive,:alive]])).
		to eq([[:alive,:alive],[:alive,:alive]])
	end
    
end