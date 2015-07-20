require 'test_helper'

class Instructor::SectionsControllerTest < ActionController::TestCase
  
  test "create section" do 
  	user = FactoryGirl.create(:user)
  	sign_in user
  	course = FactoryGirl.create(:course, user: user)
    
    assert_difference "Section.count" do 
    	post :create, { course_id: course, section: {
        title: "yolo"
        }
      }
    end
    assert_redirected_to instructor_course_path(course)

    assert_equal 1, course.sections.count
  end

  #test "create section not signed in" do
  #	course = FactoryGirl.create(:course) 

  #	assert_no_difference "Section.count" do
  #		post :create, { course_id: course, section: { title: 'yolo'
  #		}
  #	}
  #	end
  #	assert_redirected_to new_user_session_path
  	#assert false
  #end
end
