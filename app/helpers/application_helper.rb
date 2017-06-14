module ApplicationHelper
  # Returns the current Business logged-in user (if any).
  def current_business
    if user_signed_in? && current_user.present?
      @current_business ||= current_user.business
    end
  end
end
