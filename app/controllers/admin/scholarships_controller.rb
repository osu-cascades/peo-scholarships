class Admin::ScholarshipsController < Admin::AdminController

  def index
    @scholarships = Scholarship.order(application_deadline: :desc).all
  end

  def show
    @scholarship = Scholarship.includes(:questions, :applications).find(params[:id])
  end

  def new
    @scholarship = Scholarship.new
  end

  def create
    @scholarship = Scholarship.new(scholarship_params)
    if @scholarship.save
      redirect_to [:admin, @scholarship], notice: 'Scholarship created.'
    else
      render :new
    end
  end

  def edit
    @scholarship = Scholarship.find(params[:id])
  end

  def update
    @scholarship = Scholarship.find(params[:id])
    if @scholarship.updatable_by? current_user
      if @scholarship.update(scholarship_params)
        redirect_to [:admin, @scholarship], notice: 'Scholarship updated.'
      else
        render :edit
      end
    else
      redirect_to [:admin, @scholarship], alert: 'Could not update this scholarship.'
    end
  end

  def publish
    @scholarship = Scholarship.find(params[:id])
    if @scholarship.update(published: true)
      redirect_to [:admin, @scholarship], status: :see_other, notice: 'Scholarship published, and is now visible to applicants.'
    else
      redirect_to [:admin, @scholarship], status: :see_other, alert: 'Could not publish this scholarship.'
    end
  end

  def unpublish
    @scholarship = Scholarship.find(params[:id])
    if @scholarship.update(published: false)
      redirect_to [:admin, @scholarship], status: :see_other, notice: 'Scholarship unpublished, and is not visible to applicants.'
    else
      redirect_to [:admin, @scholarship], status: :see_other, alert: 'Could not unpublish this scholarship.'
    end
  end

  def destroy
    scholarship = Scholarship.find(params[:id])
    scholarship.destroy
    if scholarship.destroyed?
      redirect_to admin_scholarships_url, status: :see_other, notice: 'Scholarship deleted.'
    else
      redirect_to admin_scholarships_url, status: :see_other, alert: 'Could not delete scholarship. There are already either answered questions or applications.'
    end
  end

  private

  def scholarship_params
    params.require(:scholarship).permit(:name, :application_deadline)
  end

end
