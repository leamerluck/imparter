require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "index homepage" do 
  	get :index
  	assert_response :success
  end
end
