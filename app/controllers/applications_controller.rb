class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def create
    @scholarship = Scholarship.find(params[:scholarship_id])
    @application = Application.new(params.require(:application).permit(:name))
    @application.update(user_id:current_user.id, scholarship_id: @scholarship.id)
    if @application.save
      redirect_to scholarship_application_path(@scholarship, @application), notice: 'Scholarship created.'
      else
      render :new
      end
  end

  def new
    @scholarship = Scholarship.find(params[:scholarship_id])
    @application = Application.new(user_id:current_user.id, scholarship_id: @scholarship.id)
  end

  def show
    @scholarship = Scholarship.find(params[:scholarship_id])
    @application = Application.find(params[:id])
  end

  def destroy
    @application = Application.find(params[:id])
    if @application.destroy
      redirect_to scholarships_url, notice: 'Application deleted.'
    else
      redirect_to scholarships_url, alert: 'Could not delete application.'
    end
    end

  def edit
    @scholarship = Scholarship.find(params[:scholarship_id])
    @application = Application.find(params[:id])
  end

  def update
    @scholarship = Scholarship.find(params[:scholarship_id])
    @application = Application.find(params[:id])
    if @application.update(params.require(:application).permit(:name))
      redirect_to scholarship_application_path(@scholarship, @application), notice: 'Application updated.'
    else
      render :edit
    end
  end

end
