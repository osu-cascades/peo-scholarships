class SubmitApplication

  def initialize(application, experiences = [], awards = [])
    @application = application
    @experiences = experiences
    @awards = awards
  end

  def run
    @application.submitted = true
    @application.save
    # Hmmm...
  end

end
