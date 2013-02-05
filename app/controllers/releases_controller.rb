class ReleasesController < ApplicationController

  before_filter :init_scraper

  def new
	render json: @comix_scraper.get_new_releases  	
  end

  def upcoming
	render json: @comix_scraper.get_upcoming_releases  	
  end

  private
  def init_scraper
  	@comix_scraper = ComixScraper::Scraper.new
  end
end
