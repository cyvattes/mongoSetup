class MongoSetup
  def self.go!
    File.open('./Gemfile', 'a+') do |f|
      #Run Setup for MongoDB
      system "sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10"
      system "sudo echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee -a /etc/apt/sources.list.d/10gen.list"
      system "sudo apt-get -y update"
      system "sudo apt-get -y install mongodb-10gen"
      
      #Add gems to Gemfile
      f.write "\ngem 'mongoid'"
      puts "Mongoid added to your Gemfile."
      f.write "\ngem 'bson', '~> 3.0'"
      puts "BSON added to your Gemfile."
      puts "MongoDB is ready to go!"
      
      #Generate Mongoid Config File
      system "rails g mongoid:config"
    end
  end
end