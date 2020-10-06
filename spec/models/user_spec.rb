# rubocop: disable Layout/LineLength
require 'rails_helper'

RSpec.describe Attendance, type: :model do
  let!(:user) { User.create(name: 'Jhonathan', email: 'Jhon@test.com')}
  let!(:event) { Event.create(title: 'A very nice and well tough tittle.', body: 'Lorem Ipsum Lorem Ipsum Lorem Ipsum', location: 'Medellin', date: '2020-03-10', creator_id: user.id) }
  let!(:attendance) { Attendance.create(user_id: user.id, event_id: event.id) }

  it 'Checks for user creation' do
    expect(user).to be_valid
  end

  it 'User gets the attendances he clicks for' do
    expect(user.attendances[0]).not_to be_nil
  end

  it 'User gets the event info through attendances' do
    expect(user.attendances.first.event).not_to be_nil
  end

  it 'User gets the info of its created events' do
    expect(user.own_events[0]).to be_valid
  end

  it 'User gets the info of the attending events' do
    expect(user.events[0]).not_to be_nil
  end
end

# rubocop: enable Layout/LineLength
