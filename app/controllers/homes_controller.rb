class HomesController < ApplicationController
  def top
    @user_self = current_user
  end

  def about
  end
end
