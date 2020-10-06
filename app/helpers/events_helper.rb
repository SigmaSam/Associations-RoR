module EventsHelper
  def user
    if current_user
      link_to current_user.name.capitalize, user_path(current_user)
    else
      "You haven't signed in."
    end
  end

  def new_event
    link_to 'New Event', new_event_path if current_user
  end

  def edit_btn(argg)
    link_to 'Edit', edit_event_path(argg) unless current_user.nil?
  end

  def destroy_btn(argg)
    link_to 'Destroy', argg, method: :delete, data: { confirm: 'Are you sure?' } unless current_user.nil?
  end

  def btns
    if current_user
      link_to('Log Out', logout_path)
    else
      link_to('Sign Up', signup_path) + ' or ' +
        link_to('Log In', login_path)
    end
  end

  def index_empty_table
    if @events.empty?
      'There are not events created yet'
    else
      render 'table'
    end
  end

  def event_list(table)
    return 'There are not events.' if table.empty?

    if table == @today
      render 'today_event'
    elsif table == @upcoming
      render 'upcoming_event'
    else
      render 'past_event'
    end
  end

  def messages(event)
    render 'messages' if event.errors.any?
  end
end
