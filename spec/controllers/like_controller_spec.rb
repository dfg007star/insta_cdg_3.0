# spec/controllers/like_controllers_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:user) { create :user }
  let(:post) { create :post }
  let(:like) { create :like }
  let(:params) { { user_id: user, post_id: post } }
  before { sign_in user }

  describe '#like' do
    subject { get :create, params: params }

    it 'press like' do
      expect { subject }.to change { Like.count }.by(1)
      is_expected.to redirect_to(post_path(post.id))
    end
  end

  describe '#unlike' do
    let!(:like) { get :create, params: params }
    let(:params) { { user_id: user.id, post_id: post.id, id: 2 } }

    subject { process :destroy, params: params }

    it 'press like two times' do
      expect { subject }.to change { Like.count }.by(-1)
      is_expected.to redirect_to(post_path(post.id))
    end
  end
end
