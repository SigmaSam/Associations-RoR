module EventsHelper
  def user
    if current_user
      link_to current_user.name.capitalize, user_path(current_user)
    end
  end

  def new_event
    if current_user
      link_to 'New Event', new_event_path
    end
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
      "There are not events created yet"
    else
      render 'table'
    end
  end

  def event_list(table)
    if table.empty?
      "There are not events."
    else
      table.each do |i|
        return (i.date.to_s + '  ' + i.title.to_s)
      end
    end
  end
end
