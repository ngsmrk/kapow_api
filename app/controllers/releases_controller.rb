class ReleasesController < ApplicationController
  include ActionController::MimeResponds

  before_filter :init_scraper

  def new
	json_response @comix_scraper.get_new_releases
  end

  def upcoming
	json_response @comix_scraper.get_upcoming_releases
  end

  private
  def init_scraper
  	@comix_scraper = ComixScraper::Scraper.new
  end

  def json_response release_data
	respond_to do |format|
        format.json { render json: release_data }
        format.xml { render :text => "Unsupported format", :status => 500 }
    end
  end
end
