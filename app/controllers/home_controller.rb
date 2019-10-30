class HomeController < ApplicationController
  def index
    return redirect_to super_admin_dashboard_index_path if super_admin?

    redirect_to(current_organisation.ips.empty? ? new_organisation_setup_instructions_path : overview_index_path)
  end
end
