require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase

   test "new course page loads" do
   	 FactoryGirl.create(:user)
   	 current_user
     get :new
     assert_response :success
   end
   
end
