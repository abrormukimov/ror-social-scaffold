require 'rails_helper'

RSpec.feature 'Create comment', type: :feature do
  before(:each) do
    User.create(name: 'Abror', email: 'abror@abror.com', password: '123456', password_confirmation: '123456')
    visit 'users/sign_in'
    within '#new_user' do
      fill_in 'user_email', with: 'abror@abror.com'
      fill_in 'user_password', with: '123456'
    end
    click_button 'Log in'
    fill_in 'post_content', with: 'New post'
    click_button 'commit'
    within('#new_comment') do
      fill_in 'comment_content', with: 'new comment'
      click_button 'commit'
    end
  end

  it 'should create a new comment' do
    expect(page).to have_content('new comment')
  end
end