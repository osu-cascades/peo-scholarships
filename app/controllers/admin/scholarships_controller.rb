class Admin::ScholarshipsController < Admin::AdminController

  def index
    @scholarships = Scholarship.all
  end

  def show
    @scholarship = Scholarship.find(params[:id])
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
      render :update
    end
  end

  def destroy
    @scholarship = Scholarship.find(params[:id])
    @scholarship.destroy
    redirect_to admin_scholarships_url
  end

end
