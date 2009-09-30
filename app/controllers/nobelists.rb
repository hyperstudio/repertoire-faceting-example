class Nobelists < Application

  include Merb::Helpers::DateAndTime

  def index(search='')
    @search = search
    render
  end
  
  # webservices; ignores search
  
  def counts(facet, search, filter={})
    provides :js

    order = case facet
    when 'nobel_year' then [:nobel_year.asc, :count.desc]
    when 'birthdate'  then [:birthdate.asc, :count.desc]
    else [:count.desc]
    end

    search = "%#{search}%"
    @counts = Nobelist.facet_count(facet, :refinements => filter, :conditions => ["name ilike ?", search], :order => order, :nullable => false)
    display @counts
  end

  def results(search, filter={})
    provides :html
    
    @search = search
    search = "%#{search}%"
    @results = Nobelist.facet_results(:refinements => filter, :conditions => ["name ilike ?", search], :order => [:nobel_year])
    display @results, :layout => false
  end
  
end
