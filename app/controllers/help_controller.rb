class HelpController < ApplicationController
  def index
    @end_user_docs_link = SITE_CONFIG['end_user_docs_link']
    @organisation_docs_link = SITE_CONFIG['organisation_docs_link']
  end

  def create
    template_id = GOV_NOTIFY_CONFIG['help_email']['template_id']

    SendHelpEmail.new(
      notifications_gateway: EmailGateway.new
    ).execute(
      email: GOV_NOTIFY_CONFIG['support_email'],
      sender_email: current_user.email,
      name: current_user.name,
      organisation: current_organisation.name,
      details: params[:details],
      phone: params[:contact_number],
      subject: params[:subject],
      template_id: template_id
    )
  end
end