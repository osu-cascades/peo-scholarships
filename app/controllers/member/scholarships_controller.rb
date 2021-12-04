class Member::ScholarshipsController < Member::MemberController

  def index
    @scholarships = Scholarship.order(application_deadline: :desc).all
  end

end
