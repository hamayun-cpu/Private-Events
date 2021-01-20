require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'name presence' do
    let(:u) { User.new }
    it 'if name not present' do
      u.name = ''
      u.valid?
      expect(u.errors[:name]).to include("can't be blank")
    end

    it 'if name present' do
      u.name = 'user'
      u.valid?
      expect(u.errors[:name]).to_not include("can't be blank")
    end
  end
end
