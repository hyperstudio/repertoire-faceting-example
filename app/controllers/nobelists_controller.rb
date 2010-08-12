class NobelistsController < ApplicationController

#  include Repertoire::Faceting::Controller

  def index
    @search = params[:search] || ''
    render
  end

  def visualize
    @search = params[:search] || ''
    render
  end
  
  # webservices
  
  def counts
    name   = params[:facet]
    filter = params[:filter] || {}
    
    @counts = base(name).refine(filter).count
    
    render :json => @counts.to_a
  end

  def results
    filter = params[:filter] || {}
    
    @results = base.refine(filter).to_a

    render @results, :layout => false
  end

  def base(facet=nil)
    search = "%#{params[:search]}%"
    
    base = Nobelist
    base = base.facet_for(facet) if facet
    
    base.where(["name ilike ?", search])
  end
  
end
