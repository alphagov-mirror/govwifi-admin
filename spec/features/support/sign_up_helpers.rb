require 'support/confirmation_use_case_spy'

def sign_up_for_account(email: 'default@gov.uk')
  visit new_user_registration_path
  fill_in 'user_email', with: email
  click_on 'Sign up'
end

def update_user_details(password: 'supersecret', confirmed_password: 'supersecret', name: 'bob')
  return unless confirmation_email_received?
  visit confirmation_email_link
  fill_in 'Name', with: name
  fill_in 'New password', with: password
  fill_in 'Confirm new password', with: confirmed_password
  click_on 'Save my password'
end

def confirmation_email_link
  ConfirmationUseCaseSpy.last_confirmation_url
end

def confirmation_email_received?
  !ConfirmationUseCaseSpy.last_confirmation_url.nil?
end

def sign_in_user(user)
  user.confirm unless user.confirmed?
  login_as(user, scope: :user)
end