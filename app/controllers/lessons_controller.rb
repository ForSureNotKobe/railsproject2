class LessonsController < ApplicationController

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Company.find(params[:company_id]).lessons.new(lesson_params)
    if @lesson.save
      flash[:success] = "lessons has been created!"
      redirect_to company_path(current_user.company)
    else
      render 'new'
    end
  end

  def show
    @lesson = Company.find(params[:company_id]).lessons.find(params[:id])
  end

  def edit
    @lesson = Company.find(params[:company_id]).lessons.find(params[:id])
  end

  def update
    @lesson = Company.find(params[:company_id]).lessons.find(params[:id])
    if @lesson.update(lesson_params)
      flash[:success] = "Lesson data updated!"
      redirect_to company_lessons_path(@company)
    else
      render 'edit'
    end
  end

  def index
    @lessons = current_user.company.lessons
  end

  def destroy
    Company.find(params[:company_id]).lessons.find(params[:id]).destroy
    flash[:success] = "Lesson deleted!"
    redirect_to company_lessons_path(@company)
  end

  private

  def lesson_params
    params.require(:lesson).permit(:name, :time, :note, :price, :company_id)
  end
end
