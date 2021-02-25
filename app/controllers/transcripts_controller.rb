class TranscriptsController < ApplicationController

  def destroy
    @scholarship = Scholarship.find(params[:scholarship_id])
    @application = Application.find(params[:application_id])
    @attachment = @application.transcripts.find_by(params[:trancript_id])
    @attachment.purge
    redirect_to edit_scholarship_application_path(@scholarship, @application)
  end
end
