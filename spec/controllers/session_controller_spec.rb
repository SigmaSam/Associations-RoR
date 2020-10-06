# rubocop: disable Layout/LineLength

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let!(:user) { User.create(name: 'Jhonathan', email: 'Jhon@test.com') }
  let!(:event) { Event.create(title: 'A very nice and well tough tittle.', body: 'Lorem Ipsum Lorem Ipsum Lorem Ipsum', location: 'Medellin', date: '2020-03-10') }

  it 'checks for the creation of a session with a valid user' do
    post :create, params: { user: { name: user.name } }
    expect(subject).to render_template('sessions/new')
  end

  it 'checks redirection from a invalid user' do
    post :create, params: { user: { name: nil } }
    expect(subject).to render_template('sessions/new')
  end

  it 'Checks the page refresh with the closed session' do
    get :destroy
    expect(subject).to redirect_to('/events')
  end
end

# rubocop: enable Layout/LineLength
