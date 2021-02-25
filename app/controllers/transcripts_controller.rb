class TranscriptsController < ApplicationController

  def destroy
    @scholarship = Scholarship.find(params[:scholarship_id])
    @application = current_user.applications.find(params[:application_id])
    @attachment = @application.transcripts.find_by(params[:trancript_id])
    @attachment.purge
    redirect_to edit_scholarship_application_path(@scholarship, @application)
  end
end
