class Business
  include DataMapper::Resource
  
  property :id,   Serial
  # this is just a GIS faceting demo: so no need to map real properties on the item
  
  is :faceted, :size,
               :ownership,
               :annual_pay,
               :naics =>  :nested,
               :area =>   :geom
end