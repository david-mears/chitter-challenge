require 'data_mapper'
require_relative 'peep'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'postgres://david@localhost/chitter')

class Maker
  include DataMapper::Resource

  has n, :peeps

  property :id,           Serial, :key => true
  property :displayname,  String
  property :username,     String

  def self.current_user=(maker)
    @current_user = maker
  end

  def self.current_user
    @current_user
  end 

end