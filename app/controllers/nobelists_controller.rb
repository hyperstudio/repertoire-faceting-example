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
  def base
    search = "%#{params[:search]}%"
    Nobelist.where(["name ilike ?", search])
  end

end
