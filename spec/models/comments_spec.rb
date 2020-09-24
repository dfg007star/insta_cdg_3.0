# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validations tests' do
    it { is_expected.to belong_to(:post) }
    it { is_expected.to belong_to(:user) }

    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_length_of(:content).is_at_most(250) }
  end
end
