class Nobelist
  include DataMapper::Resource
  
  property :id,             Serial
  property :name,           String, :nullable => false
  property :birthdate,      DateTime
  property :birth_country,  String
  property :birth_state,    String
  property :birth_city,     String
  property :url,            String, :length => 200
  property :discipline,     String
  property :shared,         Boolean
  property :last_name,      String, :nullable => false
  property :nobel_year,     Integer, :nullable => false
  property :deceased,       Boolean
  property :co_winner,      String, :length => 200
  property :imageUrl,       String, :length => 200
  property :imageCredit,    String, :length => 200

  has n, :affiliations

  is :faceted, :discipline,
               :nobel_year,
               :degree,
               :birth_place => :nested,
               :birthdate   => :nested
end