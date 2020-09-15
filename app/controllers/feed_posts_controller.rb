class FeedPostsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.following.any?
      @posts = Post.where(user_id: current_user.following.pluck(:id)).order(created_at: :desc)
    else
      Post.none
    end
  end
end
