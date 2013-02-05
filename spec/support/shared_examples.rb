shared_examples :api do
    
  it "returns http success" do
    response.should be_success
  end

  it 'has the correct content type' do
    response.content_type.should == 'application/json'
  end
  
  it 'contains the correct response body' do
  	puts response.body
    response.body.should include_json(@release_data.shipping_date.to_json).at_path("shipping_date")
    response.body.should include_json(@release_data.categories.to_json)
    response.body.should include_json(@release_data.comix.to_json)    
  end  
end