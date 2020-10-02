class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :user_login, except: %i[index show]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @users = User.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    set_event
    @user = User.find(@event.creator.id)
  end

  # GET /events/new
  def new
    @user = current_user
    @event = @user.events.build
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
   @event = Event.new(event_params)
   @event.creator_id = current_user.id

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
    end
  end

=begin  
  def follow

    @attendees = Attendance
    @event = Event.find(params[:id])
    @attendees.event_id << @event.id
    @attendees.user_id << current_user.id
    @attendees.users.where(event_id: event.id)
    redirect_back(fallback_location: user_path(@user))
  end
  
  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.find_by(followee_id: @user.id).destroy
    redirect_back(fallback_location: user_path(@user))
  end 
=end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :body, :date, :location)
    end

    def user_login
      redirect_to new_user_path if current_user.nil?
    end

    def attendance_params
      params.require(:attendance).permit(:user_id, :event_id)
    end
end
