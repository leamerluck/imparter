class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_enrolled_for_current_course, :only => [:show]

	def show
	end

	private

	def require_enrolled_for_current_course
		this_course = current_lesson.section.course
		if !this_course.user.enrolled_in?(this_course)
			redirect_to course_path(this_course),	alert: 'You Must Be Enrolled to View the Lessons'
		end
	end

	helper_method :current_lesson
	def current_lesson
		@current_lesson ||= Lesson.find(params[:id])
	end
end
