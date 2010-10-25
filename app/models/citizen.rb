class Citizen < ActiveRecord::Base
  include Repertoire::Faceting::Model

  # see 'repertoire-faceting/test/fixtures/citizens.sql'
  
  facet :gender
  facet :occupation
  facet :birthdate, group("EXTRACT(year FROM birthdate)::INT", "trim(to_char(birthdate, 'Month'))", "EXTRACT(day FROM birthdate)::INT")
                    .order("birthdate ASC")
  facet :birth_place, group(:birth_state, :birth_city)

end
