class SetupInstructionsController < ApplicationController
  def index
    @ips = current_organisation.ips
    @locations = current_organisation.locations
    @team_members = current_organisation.users
    @london_radius_ips = radius_ips[:london]
    @dublin_radius_ips = radius_ips[:dublin]
    @current_org_signed_mou = current_organisation.has_signed_mou?
  end

  def poster
    send_file(
      Rails.root.join("app/assets/images/govwifi-poster.png"),
      type: "image/png",
      disposition: "inline",
      filename: "GovWifi-poster.png",
    )
  end

private

  def radius_ips
    view_radius = UseCases::Organisation::ViewRadiusIPAddresses.new(organisation_id: current_organisation.id)
    view_radius.execute
  end
end
