module ApplicationHelper
  def time_zone_str(dt)
    current_user && dt.in_time_zone(current_user.time_zone) || dt
  end
end
