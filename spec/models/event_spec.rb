# rubocop: disable Layout/LineLength
require 'rails_helper'

RSpec.describe Event, type: :model do
  let!(:user) { User.create(name: 'Jhonathan', email: 'Jhon@test.com') }
  let!(:event) { Event.create(title: 'A very nice and well tough tittle.', body: 'Lorem Ipsum Lorem Ipsum Lorem Ipsum', location: 'Medellin', date: '2020-03-10', creator_id: user.id) }
  let!(:attendance) { Attendance.create(user_id: user.id, event_id: event.id) }

  it 'Checks for a valid event input' do
    expect(event).to be_valid
  end

  it 'Checks for a valid event input' do
    test = Event.create(title: nil, body: nil)
    expect(test).to be_invalid
  end

  it 'Event is related to the creating user' do
    expect(event.creator).not_to be_nil
  end

  it 'Event gets the attendances' do
    expect(event.attendees[0]).not_to be_nil
  end

  it 'Event get the user info through the attendances' do
    expect(event.attendees.name).not_to be_nil
  end
end

# rubocop: enable Layout/LineLength
