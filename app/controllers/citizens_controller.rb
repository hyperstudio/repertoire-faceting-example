class CitizensController < ApplicationController

  include Repertoire::Faceting::Controller

  def index
    @search = params[:search] || ''
    render
  end

  # webservice bases

  def results
    filter = params[:filter] || {}
    # over-ridden to limit results per page
    @results = base.refine(filter).order(:last_name).limit(100).to_a
    respond_to do |format|
      format.html { render @results, :layout => false }
      format.json { render :json => @results }
    end
  end

  protected
  def base
    if (search = params[:search]).blank?
      Citizen
    else
      Citizen.where([ "_fulltext @@ to_tsquery(?)", search ])
    end
  end

end
