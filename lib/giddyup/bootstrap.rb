### ACTIVERECORD SETUP
require 'uri'
# Extracts the DB url out of the environment
dburl = URI.parse(ENV["DATABASE_URL"])

db_configuration = {
  :adapter => :postgresql,
  :port => dburl.port,
  :host => dburl.host,
  :username => dburl.user,
  :password => dburl.password,
  :database => dburl.path.split("/").last
}
                                        
ActiveRecord::Base.establish_connection(db_configuration)

### S3 SETUP
s3config = {
  :provider => 'AWS',
  :aws_access_key_id => ENV['S3_AKID'],
  :aws_secret_access_key => ENV['S3_SECRET']
}

GiddyUp::S3 = Fog::Storage.new(s3config)
GiddyUp::LogBucket = ENV['S3_BUCKET']

### BASIC AUTH SETUP
GiddyUp::AUTH_USER = ENV['AUTH_USER']
GiddyUp::AUTH_PASSWORD = ENV['AUTH_PASSWORD']