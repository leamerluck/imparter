require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase

   test "new course" do
   	 user = FactoryGirl.create(:user)
   	 sign_in user
     get :new
     assert_response :success
   end

  test "create course" do 
   	user = FactoryGirl.create(:user)
   	sign_in user
   	
 
   	assert_difference "Course.count" do
	   post :create, 
   		:course => {
   		:title => "Yolo",
   		:description => "Easy",
   		:cost => "1"
   		}
	  end
 
	  assert_redirected_to instructor_course_path(assigns(:course))
 
	  assert_equal 1, user.courses.count
	end

	test "create user not signed in" do 
		post :create, {course: {
   		title: "Yolo",
   		description: "Easy",
   		cost: "1"
   		}
	   }

	  assert_redirected_to new_user_session_path
	end

	test "create invalid" do
		user = FactoryGirl.create(:user)
		sign_in user

		assert_no_difference "Course.count" do
			post :create, {course: {
	   		title: "",
	   		description: "",
	   		cost: ""
	   		}
		   }

		   assert_response :unprocessable_entity
		end
	end

end
