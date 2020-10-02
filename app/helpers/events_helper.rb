module EventsHelper
  def edit_btn(argg)
    link_to 'Edit', edit_event_path(argg) unless current_user.nil?
  end

  def destroy_btn(argg)
    link_to 'Destroy', argg, method: :delete, data: { confirm: 'Are you sure?' } unless current_user.nil?
  end
end
