# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @user = current_user.name.sub(/^./, &:upcase) if current_user
  end

  def contact; end
end
