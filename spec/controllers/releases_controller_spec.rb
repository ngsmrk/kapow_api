require 'spec_helper'

describe ReleasesController do

  describe "GET 'new'" do
    
    before :each do
      init_mocks
      @scraper.should_receive(:get_new_releases).and_return @release_data
      request.accept = 'application/json'

      get 'new'
    end

    it_behaves_like :api
  end

  describe "GET 'upcoming'" do
    
    before :each do
      init_mocks
      @scraper.should_receive(:get_upcoming_releases).and_return @release_data
      request.accept = 'application/json'
            
      get 'upcoming'
    end    
    
    it_behaves_like :api     
  end
  
  def init_mocks
    @scraper = mock(ComixScraper::Scraper)
    ComixScraper::Scraper.should_receive(:new).and_return(@scraper)
    
    @release_data = ComixScraper::ReleaseData.new
    @release_data.categories = ["Marvel", "DC"]
    @release_data.shipping_date = DateTime.now
    
    @comic = ComixScraper::Comic.new "DC", "id", "title", "$1.99"
    @release_data.comix << @comic
  end

end
