class Citizen
  include DataMapper::Resource
  
  property :id,             Serial
  property :first_name,     String
  property :last_name,      String
  property :gender,         String
  property :occupation,     String
  property :birth_city,     String
  property :birth_state,    String
  property :birthdate,      DateTime
	property :social_security, String
  
  is :faceted, :gender,                   
               :occupation,
               :birthdate,
               :birth_place => :nested,
               :birth_place_geom => :geom
end