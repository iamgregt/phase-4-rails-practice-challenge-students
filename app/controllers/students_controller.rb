class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json: Student.all
    end

    def show
        student = Student.find(params[:id])
        render json: student
    end

    def create
        student = Student.create(student_params)
        render json: student, status: :created
    end

    def destroy
        student = Student.find_by(id:params[:id])
        student.destroy
        head :no_content
    end

    private

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

    def render_not_found_response
        render json: {error: "Student not found"}, status: :not_found
    end
end
