module UsersHelper
  def empty_own_table
    if @user.own_events.empty?
      "You haven't created any avent yet."
    else
      render 'own_table'
    end
  end

  def empty_attend_table
    if @user.events.empty?
      "You are not registered in any event yet."
    else
      render 'attend_events'
    end
  end
  
  def empty_attended
    if @user.events.previous.empty?
      "You have not attended to any event yet."
    else
      render 'attended'
    end
  end

  def empty_next_table
    if @user.events.today.empty?
      "There are no attending events for today."
    else
      render 'next_attending'
    end
  end

  def messages(user)
    if user.errors.any?
      render 'messages'
    end
  end
  
end
