# spec/controllers/comment_controllers_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create :random_user }
  before { sign_in user }
  let!(:post) { create :post }
  describe '#create' do
    let(:params) do
      {
        post_id: post.id,
        comment: {
          content: 'Comment'
        }
      }
    end
    subject { process :create, method: :post, params: params }

    it 'should leave a comment' do
      expect { subject }.to change { Comment.count }.by(1)
      is_expected.to redirect_to(post_path(post.id))
    end
  end
end
