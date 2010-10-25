class Nobelist < ActiveRecord::Base
  include Repertoire::Faceting::Model
  
  # see 'repertoire-faceting/test/fixtures/nobelists.sql'

  has_many :affiliations
  
  facet :discipline
  facet :nobel_year, order('nobel_year')
  facet :degree, joins(:affiliations).group('affiliations.degree')
  facet :birth_place, group(:birth_country, :birth_state, :birth_city)
  facet :birth_decade, group('((EXTRACT(year FROM birthdate)::integer / 10::integer) * 10)').nils(false).order('birth_decade')

end