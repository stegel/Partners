class Partner < ActiveRecord::Base

	def photosets
		output = []

		json = Net::HTTP.get(URI.parse("http://api.flickr.com/services/rest/?method=flickr.collections.getTree&collection_id=72157624659199715&api_key=6f977fc52e81b8f45764d91ab84999c2&format=json&nojsoncallback=1&user_id=52768084@N06"))
		result = ActiveSupport::JSON.decode(json)
		unless result['stat'] == "fail"	
			collection = result['collections']['collection'][0]

			collection.each do |coll|
				output << coll
			end
		end
		
		output
	end

end
