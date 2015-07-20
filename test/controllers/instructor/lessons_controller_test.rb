require 'test_helper'

class Instructor::LessonsControllerTest < ActionController::TestCase

  test "create lesson" do 
  	user = FactoryGirl.create(:user)
  	sign_in user
  	course = FactoryGirl.create(:course, user: user)
  	section = FactoryGirl.create(:section, course: course)

  	assert_difference "Lesson.count" do 
  		post :create, { section_id: section, lesson: {
  			title: 'yolo', 
  			subtitle: 'part 1'
  			}	
  		}
  	end
  	assert_redirected_to instructor_course_path(course)
  	assert_equal 1, section.lessons.count
  end

end
