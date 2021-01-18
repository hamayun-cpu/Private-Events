require 'rails_helper'

RSpec.describe 'the signin process', type: :feature do
  before :each do
    User.create(Name: 'user')
  end

  it 'signs me in' do
    visit '/sign_in'
    within('.login-form') do
      fill_in 'Name', with: 'user'
    end
    click_button 'Login'
    expect(current_path).to eq(root_path)
  end

  it 'render sign in form if not valid' do
    visit '/sign_in'
    within('.login-form') do
      fill_in 'Name', with: 'user'
    end
    click_button 'Login'
    expect(current_path).to eq(sign_in_path)
  end
end