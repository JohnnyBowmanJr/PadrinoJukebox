class Track < ActiveRecord::Base

#Add a class method to the Track model, which performs a search for tracks with a given name 
#and returns an array of Track objects. Use your own client ID.
	def self.search(name)
		# create a client object with your app credentials
		client = Soundcloud.new(:client_id => '398adc82aeeaedd7bed5f77f5c29d0c1')

		# find all tracks with the genre 'punk' that have a tempo greater than 120 bpm.
		tracks = client.get('/tracks', :q => name)

		tracks
		
	end

	def self.find(id)
		client = Soundcloud.new(:client_id => '398adc82aeeaedd7bed5f77f5c29d0c1')
		client.get('/tracks', :id => id)
	end


end
