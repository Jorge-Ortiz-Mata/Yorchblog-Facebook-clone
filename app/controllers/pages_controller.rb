class PagesController < ApplicationController

  before_action :require_user
  before_action :user_doesnt_have_profile

  def home
    @posts = Post.order('created_at DESC')
    @post = Post.new
    @profiles = Profile.all
  end

end
