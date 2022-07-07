require './helper'

describe Helper do 
	context '.convert_from_hash_hash' do 
		it 'returns [] for {} ' do 
			expect(Helper.convert_from_hash_hash({})).to eq []
		end
		it 'returns [[]] for {0 => {}} ' do 
			expect(Helper.convert_from_hash_hash({'0' => {}})).to eq [[]]
		end
		it 'returns [[1,2,3]] for {0 => {a:1,b:2,c:3}} ' do 
			expect(Helper.convert_from_hash_hash({'0' => {a:'1',b:'2',c:'3'}})).
			to eq [[:'1',:'2',:'3']]
		end
		it 'returns [[1],[2],[3]] for {0 => {a:1}, 1 =>{b:2}, 
			2 => {c:3}} ' do 
			expect(Helper.convert_from_hash_hash({'0' => {a:'1'},
				1 => {b:'2'}, 2 => {c:'3'}})).
			to eq [[:'1'],[:'2'],[:'3']]
		end
	end

	context '.convert_to_hash_hash' do 
		it 'returns {0 => {}} for [[]]' do 
			expect(Helper.convert_to_hash_hash([[]])).to eq({'0' => {}})
		end
		it 'returns {0 => {0 => :dead,1 => :dead}} for [[:dead,:dead]]' do 
			expect(Helper.convert_to_hash_hash([[:dead,:dead]])).
			to eq({'0' => {'0' => :dead,'1' => :dead}})
		end
		it 'returns {0 => {0 => :dead}, 1 => {0 => :dead}, 2 => {0 => :alive}}
			for [[:dead],[:dead],[:alive]]' do 
			expect(Helper.convert_to_hash_hash([[:dead],[:dead],[:alive]])).
			to eq({'0' => {'0' => :dead}, '1' => {'0' => :dead}, 
				'2' => {'0' => :alive}})
		end
	end
end