class Helper 

	def self.convert_from_hash_hash(hashHash)
		hashHash.to_a.map { |e| e[1].values.map { |v| v.to_sym }  }
	end

	def self.convert_to_hash_hash(arrayArray)
		output_hash = {}
		arrayArray.each_index {|index| 
			index_hash = {}
			arrayArray[index].each_index {|sindex|
				index_hash[sindex.to_s] = arrayArray[index][sindex]
			}
			output_hash[index.to_s] = index_hash
		}
		output_hash
	end

end