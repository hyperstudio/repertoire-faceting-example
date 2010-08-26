class NobelistsController < ApplicationController

  include Repertoire::Faceting::Controller

  def index
    @search = params[:search] || ''
    render
  end

  def visualize
    @search = params[:search] || ''
    render
  end
  
  # webservice bases

  protected
  def base(facet=nil)
    search = "%#{params[:search]}%"
    
    base = Nobelist
    base = base.facet_for(facet) if facet
    
    base.where(["name ilike ?", search])
  end
  
end
