class Admin::ScholarshipsController < Admin::AdminController

  def index
    @scholarships = Scholarship.all
  end

  def show; end
  def new; end
  def create; end
  def edit; end
  def update; end
  def destroy; end

end
