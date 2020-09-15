require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations tests' do
    subject { build(:user) }

    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:active_relationships).with_foreign_key(:follower_id).class_name('Relationship') }
    it { is_expected.to have_many(:following).through(:active_relationships).source(:followed) }

    it { is_expected.to have_many(:passive_relationships).with_foreign_key(:followed_id).class_name('Relationship') }
    it { is_expected.to have_many(:followers).through(:passive_relationships).source(:follower) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(30) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }

    it { is_expected.to validate_presence_of(:password) }
  end
end
