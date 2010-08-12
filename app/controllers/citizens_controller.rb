class Citizens < Application

  include Merb::Helpers::DateAndTime

  def index(search='')
    @search = search
    render
  end
  
  def map(search='')
    @search = search
    render
  end
  
  # webservices
  
  def counts(facet, search, filter={})
    provides :js

    order = case facet
    when 'birthdate'  then [:birthdate.asc, :count.desc]
    else [:count.desc, facet]
    end
    
    extra = {}
    extra[:conditions] = ["_fulltext @@ to_tsquery(?)", search] unless search.blank?

    @counts = Citizen.facet_count(facet, {:refinements => filter, :order => order, :nullable => false}.merge(extra))
    display @counts
  end

  def results(search, filter={})
    provides :html
    
    extra = {}
    extra[:conditions] = ["_fulltext @@ to_tsquery(?)", search] unless search.blank?
    
    @search = search
    @results = Citizen.facet_results({:refinements => filter, :order => [:last_name], :limit => 100}.merge(extra))
    
    puts "ok, got #{@results.size} results"
    
    display @results, :layout => false
  end

end
