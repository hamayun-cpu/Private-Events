require 'rails_helper'

RSpec.describe 'the signin process', type: :feature do
  let(:u) { User.create(name: 'user') }

  it 'signs me in' do
    u.save
    visit '/login'
    within('.login-form') do
      fill_in 'Name', with: 'user'
    end
    click_button 'Login'
    expect(current_path).to eq('/users/1')
  end

  it 'render sign in form if not valid' do
    visit '/login'
    within('.login-form') do
      fill_in 'Name', with: ''
    end
    click_button 'Login'
    expect(current_path).to eq(login_path)
  end
end
