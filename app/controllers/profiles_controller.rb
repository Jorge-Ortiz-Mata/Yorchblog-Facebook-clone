class ProfilesController < ApplicationController

  before_action :set_profile, only: %i[ show edit update destroy ]
  before_action :require_user
  before_action :user_has_profile, only: [:new, :create]
  before_action :same_user_and_profile, only: [:edit, :update, :destroy]

  # GET /profiles/1 or /profiles/1.json
  def show
    @user_posts = @profile.user.posts.order('created_at DESC')
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles or /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :location, :genre, :telephone, :date_birth, :occupation, :avatar)
    end
end
