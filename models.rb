require 'data_mapper'
require 'dm-pager'
require 'dm-validations'
require 'dm-constraints'
require 'dm-types'

DataMapper.setup(:default, "sqlite://#{Dir.pwd}/development.db")

class User
  include DataMapper::Resource

  property :id,                 Serial
  property :email,              String, :required => true, :unique => true, :format  => :email_address,
  property :name,               String
  property :hashed_password,    String

end

class Itinerary
  include DataMapper::Resource

  property :id,                 Serial

end

class BlogPost
  include DataMapper::Resource

  property :id,           Serial
  property :coordX,       String
  property :coordY,       String
  property :title,        Text, :length => 1..300
  property :body,         Text
  property :image,        Text, :length => 1..300

  # def vote(ip, up=true)
  #   return if already_voted?(ip)
  #   self.vote_count      += 1
  #   self.up_vote_count   += 1 if up
  #   self.down_vote_count += 1 unless up
  #   self.vote_score      = self.up_vote_count - self.down_vote_count
  #   self.ips << ip
  #   self.save
  # end

  # def already_voted?(ip)
  #   (settings.block_repeated_votes? && self.ips.count(ip) != 0)
  # end

end

#class Vote
#  include DataMapper::Resource
#
#  property :id,           Serial
#  property :ip,           String, :index => true
#  property :up,           Boolean, :default => true
#
#  property :created_at,   DateTime
#  property :update_at,    DateTime
#
#  belongs_to :entry
#end

DataMapper.finalize
DataMapper.auto_upgrade!