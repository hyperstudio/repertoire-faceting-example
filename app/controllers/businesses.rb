class Businesses < Application

  include Merb::Helpers::DateAndTime

  def index(search='')
    @search = search
    render
  end
  
  # webservices
  
  def counts(facet, search, filter={})
    provides :js
    
    order = case facet
    when 'annual_pay'  then [ :annual_pay.asc ]
    when 'size'        then [ :id.asc ]
    else [:count.desc, facet]
    end

    extra = {}
    extra[:conditions] = ["_fulltext @@ to_tsquery(?)", search] unless search.blank?

    @counts = Business.facet_count(facet, {:refinements => filter, :order => order, :nullable => false}.merge(extra))
    display @counts
  end

end
