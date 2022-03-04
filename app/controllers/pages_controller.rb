class PagesController < ApplicationController

  before_action :require_user
  before_action :user_doesnt_have_profile

  def home
  end
end
