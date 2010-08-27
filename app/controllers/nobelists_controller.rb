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
  def base(name=nil)
    search = "%#{params[:search]}%"
    base = Nobelist.where(["name ilike ?", search])    
    name ? base.facet(name) : base
  end
  
end
