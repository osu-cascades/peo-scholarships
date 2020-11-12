class Admin::QuestionsController < Admin::AdminController

  def index
    @scholarship = Scholarship.includes('questions').find(params[:scholarship_id])
    @questions = @scholarship.questions
  end

  def show; end
  def new; end
  def create; end
  def edit; end
  def update; end
  def destroy; end

end
