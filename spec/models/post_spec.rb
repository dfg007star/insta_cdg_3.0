# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validations tests' do
    it { is_expected.to belong_to(:user) }

    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_most(140) }
    it { is_expected.to validate_presence_of(:image) }
  end

  context 'validates image format' do
    it 'allows to set jpeg file as an image' do
      user = create(:user)
      subject.attributes = attributes_for(:post)
      subject.user = user
      is_expected.to be_valid
    end

    it 'dont allow to set txt file as an image' do
      user = create(:user)
      subject.attributes = attributes_for(:post, :with_invalid_image)
      subject.user = user
      is_expected.to be_invalid
    end
  end
end
