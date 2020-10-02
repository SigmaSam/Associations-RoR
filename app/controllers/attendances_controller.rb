class AttendancesController < ApplicationController
  def new
    @attendee = Attendance.new
    @attendee.event_id = Event.find(params[:id]).id
  end

  def create
    @event = Event.where(id: @attendee.event_id)
    @attendee = Attendance.new(attendance_params)
    @attendee.user_id = current_user.id

    respond_to do |format|
      if @attendee.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

    def attendance_params
      params.require(:attendance).permit(:event_id)
    end
end