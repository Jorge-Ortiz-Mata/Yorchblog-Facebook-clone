class SearchesController < ApplicationController

  before_action :user_doesnt_have_profile

  def search_user
    @user_search = params[:result]
    if @user_search.present?
      @search_result = Profile.look_up(@user_search)

      if @search_result.length > 0
        #redirect_to result_path, notice: "The result is: #{@search_result}" 
        render 'searches/result'
      else 
        redirect_to root_path, alert: "Sorry, we couldn't find anything."
      end
    else
      redirect_to root_path, alert: "You must enter a value."
    end
      
  end

  #def result
  #end
end
