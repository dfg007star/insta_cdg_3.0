# spec/features/post_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Post page', :js, type: :feature do
  let!(:user) { create :user }

  scenario 'user create post' do
    login_as user

    visit new_post_path

    within 'form' do
      fill_in placeholder: 'Your description..', with: 'Description_test'
      attach_file('post[image]', Rails.root.join('spec/files/test.jpg'))
      click_button 'Upload'
    end
    page.has_css?('.card')
  end
end
