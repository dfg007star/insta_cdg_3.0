# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_post
  before_action :find_comment, only: :destroy

  def index
    @comments = Comment.all
    @comment = Car.new
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    redirect_to post_path(@post) if @comment.save
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = @post.comments.find(params[:id])
  end
end
