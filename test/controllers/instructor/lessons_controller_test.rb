require 'test_helper'

class Instructor::LessonsControllerTest < ActionController::TestCase

	def setup
		@user = FactoryGirl.create(:user)
		@course = FactoryGirl.create(:course, user: @user)
  	@section = FactoryGirl.create(:section, course: @course)
  end

  test "create lesson" do 
  	sign_in @user

  	assert_difference "Lesson.count" do 
  		post :create, { section_id: @section, lesson: {
  			title: 'yolo', 
  			subtitle: 'part 1'
  			}	
  		}
  	end
  	assert_redirected_to instructor_course_path(@course)
  	assert_equal 1, @section.lessons.count
  end

  test "create lesson not signed in" do
 
  	assert_no_difference "Lesson.count" do 
  		post :create, {section_id: @section, lesson: {
  			title: 'yolo',
  			subtitle: 'part 1'
  			}
  		}  		
  	end
 		assert_redirected_to new_user_session_path
	end
end
