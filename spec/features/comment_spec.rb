# spec/features/comment_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments', :js, type: :feature do
  scenario 'user leave a comment' do
    visit '/'
    click_link 'Sign up'
    expect(page).to have_current_path '/users/sign_up'
    fill_in placeholder: 'Name', with: 'Dima'
    fill_in placeholder: 'Email', with: 'comment_test@mail.ru'
    fill_in placeholder: 'Password', with: 'password'
    fill_in placeholder: 'Password confirmation', with: 'password'
    click_on(class: 'btn-c')

    visit new_post_path

    within 'form' do
      fill_in placeholder: 'Your description..', with: 'Description_test'
      attach_file('post[image]', Rails.root.join('spec/files/test.jpg'))
      click_button 'Upload'
    end
    find('.card-image').click
    fill_in placeholder: 'Your comment..', with: 'Comment_test'
    click_button 'Leave a comment'
    page.find('h4', text: '1 Comment')
    page.find('p', text: 'Comment_tes')
  end

  scenario 'user delete a comment' do
    visit '/'
    click_link 'Sign in'
    expect(page).to have_current_path '/users/sign_in'
    fill_in placeholder: 'Email', with: 'comment_test@mail.ru'
    fill_in placeholder: 'Password', with: 'password'
    click_on(class: 'btn-c')

    click_link 'Account'
    click_link 'Profile'

    find('.card-image').click
    find("div.user-comment a[data-method='delete']").click
    page.find('h4', text: '0 Comment')
  end
end
