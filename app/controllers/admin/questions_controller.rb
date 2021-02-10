class Admin::QuestionsController < Admin::AdminController

  def new
    @scholarship = Scholarship.find(params[:scholarship_id])
    @question = @scholarship.questions.build
  end

  def create
    @scholarship = Scholarship.find(params[:scholarship_id])
    @question = @scholarship.questions.build(question_params)
    if @question.save
      redirect_to [:admin, @scholarship], notice: 'Question added.'
    else
      render :new
    end
  end

  def edit
    @scholarship = Scholarship.find(params[:scholarship_id])
    @question = @scholarship.questions.find(params[:id])
  end

  def update
    @scholarship = Scholarship.find(params[:scholarship_id])
    @question = @scholarship.questions.find(params[:id])
    if @question.update(question_params)
      redirect_to [:admin, @scholarship], notice: 'Question updated.'
    else
      render :edit
    end
  end

  def destroy
    scholarship = Scholarship.find(params[:scholarship_id])
    question = scholarship.questions.find(params[:id])
    question.destroy
    if question.destroyed?
      redirect_to [:admin, scholarship], notice: 'Question deleted.'
    else
      redirect_to [:admin, scholarship], alert: 'Applicants have answered this question, so it cannot be deleted.'
    end
  end

  private

  def question_params
    params.require(:question).permit(:prompt)
  end

end
