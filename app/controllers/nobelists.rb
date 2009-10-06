class Nobelists < Application

  include Merb::Helpers::DateAndTime

  def index(search='')
    @search = search
    render
  end

  def visualize(search='')
    @search = search
    render
  end
  
  # webservices
  
  def counts(facet, search, filter={})
    provides :js

    order = case facet
    when 'nobel_year' then [:nobel_year.asc, :count.desc]
    when 'birthdate'  then [:birthdate.asc, :count.desc]
    else [:count.desc, facet]
    end

    search = "%#{search}%"
    @counts = Nobelist.facet_count(facet, :refinements => filter, :conditions => ["name ilike ?", search], 
                                          :order => order, :nullable => false)
    display @counts
  end

  def results(search, filter={})
    provides :html, :js
    
    @search = search
    search = "%#{search}%"
    @results = Nobelist.facet_results(:refinements => filter, :conditions => ["name ilike ?", search], 
                                      :order => [:nobel_year])
    display @results, :layout => false
  end
  
  #  
  # extra webservice for the example extending widgets for sorting
  #
  def counts_with_sorting(facet, search, filter={}, order_by='count')
    provides :js

    # example: set facet order client-side
    if order_by == 'count'
      order = [:count.desc, facet]
    else
      order = [facet, :count.desc]
    end

    search = "%#{search}%"
    @counts = Nobelist.facet_count(facet, :refinements => filter, :conditions => ["name ilike ?", search], 
                                          :order => order, :nullable => false)
    display @counts
  end
  
end
