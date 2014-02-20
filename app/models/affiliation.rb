class Affiliation < ActiveRecord::Base

  # see 'repertoire-faceting/test/nobelists.sql'

  belongs_to :nobelist
end
