require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let!(:user) { User.create(name: 'Jhonathan', email: 'Jhon@test.com')}
  let!(:event) { Event.create(title: 'A very nice and well tough tittle.', body: 'Lorem Ipsum Lorem Ipsum Lorem Ipsum', location: 'Medellin',date: '2020-03-10', creator_id: user.id) }


  it 'Checks the event index route with user logged in' do
    get :index, session: { username: user.name, user_id: user.id }
    expect(response).to render_template('events/index')
  end

  it 'Checks the event index route with no user logged in' do
    get :index, session: { username: nil, user_id: nil }
    expect(response).to redirect_to('/login')
  end

  
  it 'Checks the creation page of an event' do
    get :new, session: { username: user.name, user_id: user.id }
    expect(response).to render_template('events/new')
  end

  it 'Checks the show page of an event' do
    get :show, params: { id: event.id }, session: { username: user.name, user_id: user.id }
    expect(response).to render_template("events/show")
  end

  it 'Checks the attend button' do
    get :attend, params: { id: event.id }, session: { user_id: user.id }
    expect(response).to redirect_to("/events/#{event.id}")
  end

  it 'Checks the attend link for a non logged in user' do
    get :attend, params: { id: event.id }, session: { user_id: nil }
    expect(response).to have_http_status(302)
  end

  it 'Checks the edit page of an event' do
    post :edit, params: { id: event.id }, session: { username: user.name, user_id: user.id }
    expect(response).to render_template("events/edit")
  end

  it 'checks for the creation of an event with valid entries' do
    post :create, params: { event: { title: event.title, body: event.body, location: event.location, date: event.date, creator_id: user.id } }, session: { username: user.name, user_id: user.id }
    expect(subject).to redirect_to("/events/#{Event.last.id}")
  end

end