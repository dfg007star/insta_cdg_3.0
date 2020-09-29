# spec/controllers/feed_posts_controllers_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FeedPostsController, type: :controller do
  let(:current_user) { create :user }
  let(:followed_user) { create :random_user }
  before { sign_in current_user }

  describe '#index' do
    let!(:post) { create :post, user: followed_user }
    let(:relationship) { create :relationship, params: { followed_id: followed_user.id } }
    subject { get :index }

    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template('index') }
  end
end
