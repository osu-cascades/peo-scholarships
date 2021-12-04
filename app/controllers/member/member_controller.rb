class Member::MemberController < ApplicationController
  before_action :restrict_unless_member
end
