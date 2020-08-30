class PagesController < ApplicationController
  def home
    if current_user
    @user = current_user.name.sub(/^./, &:upcase)
    end
  end
  def contact
    
  end
end
