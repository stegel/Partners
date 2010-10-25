class Partner < ActiveRecord::Base
  belongs_to :partner_type
 validates_format_of :website, :with => URI::regexp(%w(http https)), :allow_blank => true
  
  def photosets
		output = []

		json = Net::HTTP.get(URI.parse("http://api.flickr.com/services/rest/?method=flickr.collections.getTree&collection_id=72157625039715746&api_key=6f977fc52e81b8f45764d91ab84999c2&format=json&nojsoncallback=1&user_id=52768084@N06"))
    
		result = ActiveSupport::JSON.decode(json)
		unless result['stat'] == "fail"	
			sets = result['collections']['collection'][0]['set']

			sets.each do |set|
				output << {"id" => set['id'], "title" => set['title']}
			end
		end
		
    output
  end

  def photoset
    json = Net::HTTP.get(URI.parse("http://api.flickr.com/services/rest/?method=flickr.photosets.getInfo&photoset_id=#{flickr_id}+&api_key=6f977fc52e81b8f45764d91ab84999c2&format=json&nojsoncallback=1&user_id=52768084@N06"))
    
    result = ActiveSupport::JSON.decode(json)
    unless result['stat'] == "fail" 
      set = result['photoset']
      set['title'].to_s.sub("_content","")
    end
  end
  def contact_name
    first_name + " " + last_name
  end

  def partners
    {"1" => "Contractor", "2" => "Designer", "3" => "Partner"}
  end
end
