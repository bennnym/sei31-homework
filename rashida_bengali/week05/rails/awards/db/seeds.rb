puts "Creating directors"

Director.destroy_all
Director.create(:name => 'Alfred Hitchcock', :nationality => 'English', :dob => '1899-08-12', :worth => 200000000)
Director.create(:name => 'Quentin Tarantino', :nationality => 'American', :dob => '1963-03-26', :worth => 100000000)


puts "Creating Movies"

Movie.destroy_all
Movie.create(:name => 'Conjuring', :genre => 'Horror', :released => '2016-06-13', :duration => 134)
Movie.create(:name => 'Avengers', :genre => 'Action', :released => '2019-04-25', :duration => 180)
