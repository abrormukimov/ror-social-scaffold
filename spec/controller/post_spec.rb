require 'rails_helper'

RSpec.feature 'Post', type: :feature do
  before :each do
    User.create(name: 'Abror', email: 'abror@abror.com', password: '123456', password_confirmation: '123456')
    visit 'users/sign_in'
    within('#new_user') do
      fill_in 'user_email', with: 'abror@abror.com'
      fill_in 'user_password', with: '123456'
    end
    click_button 'Log in'
    fill_in 'post_content', with: 'New post'
    click_button 'commit'
  end

  it 'should create a new post' do
    expect(page).to have_content 'New post'
  end
end
