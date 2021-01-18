# rubocop:disable Layout/LineLength
require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'description presence' do
    let(:u) { Event.new }
    it 'if description not present' do
      u.description = ''
      u.valid?
      expect(u.errors[:description]).to include("can't be blank")
    end

    it 'if description present' do
      u.description = 'user'
      u.valid?
      expect(u.errors[:description]).to_not include("can't be blank")
    end
  end

  describe 'date presence' do
    let(:u) { Event.new }
    it 'if date not present' do
      u.event_date = ''
      u.valid?
      expect(u.errors[:event_date]).to include("can't be blank")
    end

    it 'if date present' do
      u.event_date = '2021-10-11
      18:42:00'
      u.valid?
      expect(u.errors[:event_date]).to_not include("can't be blank")
    end

    it 'if date present but wrong format' do
      u.event_date = 'qwer'
      u.valid?
      expect(u.errors[:event_date]).to include("can't be blank")
    end
  end

  describe 'all presence' do
    it 'if creator_id not present' do
      expect { Event.create!(description: 'description', event_date: '2020-11-22 18:42:00') }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Creator must exist')
    end

    it 'if all present' do
      User.create!(name: 'test1')
      expect(Event.create!(description: 'description', event_date: '2020-11-22 18:42:00', creator_id: User.find(1).id).valid?).to be true
    end
  end
end

# rubocop:enable Layout/LineLength
