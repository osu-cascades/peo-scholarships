class Admin::ScholarshipsController < Admin::AdminController

  def index
    @scholarships = Scholarship.all
  end

  def show
    @scholarship = Scholarship.includes(:questions, :applications).find(params[:id])
  end

  def new
    @scholarship = Scholarship.new
  end

  def create
    @scholarship = Scholarship.new(params.require(:scholarship).permit(:name))
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
    if @scholarship.update(params.require(:scholarship).permit(:name))
      redirect_to [:admin, @scholarship], notice: 'Scholarship updated.'
    else
      render :edit
    end
  end

  def publish
    @scholarship = Scholarship.find(params[:id])
    if @scholarship.update(published: true)
      redirect_to [:admin, @scholarship], notice: 'Scholarship published, and is now visible to applicants.'
    else
      redirect_to [:admin, @scholarship], alert: 'Could not publish this scholarship.'
    end
  end

  def unpublish
    @scholarship = Scholarship.find(params[:id])
    if @scholarship.update(published: false)
      redirect_to [:admin, @scholarship], notice: 'Scholarship unpublished, and is not visible to applicants.'
    else
      redirect_to [:admin, @scholarship], alert: 'Could not unpublish this scholarship.'
    end
  end

  def destroy
    scholarship = Scholarship.find(params[:id])
    scholarship.destroy
    if scholarship.destroyed?
      redirect_to admin_scholarships_url, notice: 'Scholarship deleted.'
    else
      redirect_to admin_scholarships_url, alert: 'Could not delete scholarship. There are already either answered questions or applications.'
    end
  end

end
