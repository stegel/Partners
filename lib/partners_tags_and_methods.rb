module PartnersTagsAndMethods
	
	include Radiant::Taggable

	tag "partner" do |tag|
		tag.expand
	end

	tag "title" do |tag|
		page = tag.locals.page
		page.title
	end
end
