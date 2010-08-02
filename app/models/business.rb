class Business < ActiveRecord::Base

  # this is just a GIS faceting demo: so no need to map real properties on the item

=begin  
  is :faceted, :size,
               :ownership,
               :annual_pay,
               :naics =>  :nested,
               :area =>   :geom
=end

end