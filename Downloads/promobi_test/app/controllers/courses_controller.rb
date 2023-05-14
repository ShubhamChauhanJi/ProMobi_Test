class CoursesController < ApplicationController
  def create
    @course = Course.new(course_params)
    if @course.save
      render json: @course.as_json(include: [ :tutors ]), status: :created
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def index
    @courses = Course.all.as_json(include: [ :tutors ])
    if  @courses.present?
     render json: @courses, status: 200
    else
      render json: "Data Not Available."
    end
  end

  private

  def course_params
    params.require(:course).permit(:id, :name, :description, :cost,  tutors_attributes: [ :id, :name, :age, :experience, :_destroy])
  end
end
