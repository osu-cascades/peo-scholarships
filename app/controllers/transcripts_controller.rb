class TranscriptsController < ApplicationController

  def destroy
    @scholarship = Scholarship.open.find(params[:scholarship_id])
    @application = current_user.applications.find(params[:application_id])
    @attachment = @application.transcripts.find(params[:transcript_id])
    @attachment.purge
    redirect_to edit_scholarship_application_path(@scholarship, @application)

  rescue ActiveRecord::RecordNotFound
    redirect_to scholarships_path, alert: 'There was a problem adding this transcript.'
  end
end
