class Admin::AdminController < ApplicationController
  before_action :restrict_unless_admin
end
