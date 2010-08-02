class Nobelist < ActiveRecord::Base

  # see 'repertoire-faceting/test/nobelists.sql'

  has_many :affiliations

=begin

  is :faceted, :discipline,
               :nobel_year,
               :degree,
               :birthdate,
               :birth_place => :nested
=end

end