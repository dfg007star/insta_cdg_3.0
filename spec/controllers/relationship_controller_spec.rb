# spec/controllers/relationship_controllers_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RelationshipsController, type: :controller do
  let(:current_user) { create :user }
  let(:followed_user) { create :random_user }
  before { sign_in current_user }

  describe '#create' do
    let(:params) do
      {
        followed_id: followed_user.id
      }
    end
    subject { process :create, method: :post, params: params }

    it 'should make relationship' do
      expect { subject }.to change { Relationship.count }.by(1)
      is_expected.to redirect_to(user_path(followed_user.id))
    end
  end

  describe '#delete' do
    let!(:relationship) { process :create, method: :post, params: params }
    let(:params) do
      {
        id: 2,
        followed_id: followed_user.id
      }
    end
    subject { process :destroy, params: params }

    it 'should destroy relationship' do
      expect { subject }.to change { Relationship.count }.by(-1)
      is_expected.to redirect_to(user_path(followed_user.id))
    end
  end
end
