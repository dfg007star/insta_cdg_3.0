# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @user = current_user.name.split.map(&:capitalize).join(' ') if current_user
  end
end
