class Admin::QuestionsController < Admin::AdminController

  def index
    @scholarship = Scholarship.includes('questions').find(params[:scholarship_id])
    @questions = @scholarship.questions
  end

  def show; end

  def new
    @scholarship = Scholarship.find(params[:scholarship_id])
    @question = @scholarship.questions.build
  end

  def create
    @scholarship = Scholarship.find(params[:scholarship_id])
    @question = @scholarship.questions.build(question_params)
    if @question.save
      redirect_to [:admin, @scholarship, :questions], notice: 'Question added.'
    else
      render :new
    end
  end

  def edit; end
  def update; end
  def destroy; end

  private

  def question_params
    params.require(:question).permit(:prompt)
  end

end
