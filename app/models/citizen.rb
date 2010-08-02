class Citizen < ActiveRecord::Base
  
=begin  
  is :faceted, :gender,                   
               :occupation,
               :birthdate,
               :birth_place => :nested,
               :birth_place_geom => :geom
=end

end