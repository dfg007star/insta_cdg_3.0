# spec/features/post_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Post page', :js, type: :feature do
  scenario 'user create post' do
    visit '/'
    click_link 'Sign up'
    expect(page).to have_current_path '/users/sign_up'
    fill_in placeholder: 'Name', with: 'Dima'
    fill_in placeholder: 'Email', with: 'post_test@mail.ru'
    fill_in placeholder: 'Password', with: 'password'
    fill_in placeholder: 'Password confirmation', with: 'password'
    click_on(class: 'btn-c')

    visit new_post_path

    within 'form' do
      fill_in placeholder: 'Your description..', with: 'Description_test'
      attach_file('post[image]', Rails.root.join('spec/files/test.jpg'))
      click_button 'Upload'
    end
    page.has_css?('.card')
  end
end
