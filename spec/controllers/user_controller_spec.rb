require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { User.create(name: 'Jhonathan', email: 'Jhon@test.com') }
  
  it 'Checks the creation of a new user' do
    get :new, session: { username: user.name, user_id: user.id }
    expect(response).to render_template('users/new')
  end

  it 'Checks the show page of an user' do
    get :show, params: { id: user.id }, session: { username: user.name, user_id: user.id }
    expect(response).to render_template("users/show")
  end

  it 'Checks the edit page of an user' do
    post :edit, params: { id: user.id }, session: { username: user.name, user_id: user.id }
    expect(response).to render_template('users/edit')
  end

  it 'checks for the creation of an new user with valid entries' do
    post :create, params: { user: { name: user.name, email: user.email } }
    expect(subject).to redirect_to("/users/#{User.last.id}")
  end
end