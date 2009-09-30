class Affiliation
  include DataMapper::Resource
  
  property :id,     Serial
  property :detail, String, :length => 200, :nullable => false
  property :degree, String
  property :year,   Integer
  
  belongs_to :nobelist
end