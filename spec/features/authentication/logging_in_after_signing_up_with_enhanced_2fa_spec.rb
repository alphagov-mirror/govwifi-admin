require "support/notifications_service"
require "support/confirmation_use_case"

describe "Logging in after signing up", type: :feature do
  let(:correct_password) { "f1uffy-bu44ies!~plant" }

  include_context "when sending a confirmation email"
  include_context "when using the notifications service"

  before do
    allow(Rails.application.config).to receive(:enable_enhanced_2fa_experience).and_return true

    sign_up_for_account(email: "tom@gov.uk")
    update_user_details(password: correct_password)
    complete_two_factor_authentication

    click_on "Sign out"

    fill_in "Email", with: "tom@gov.uk"
    fill_in "Password", with: password

    click_on "Continue"
  end

  context "with correct password" do
    let(:password) { correct_password }

    it "signs me in" do
      expect(page).to have_content "Sign out"
    end
  end

  context "with incorrect password" do
    let(:password) { "coarse" }

    it_behaves_like "not signed in"

    it "displays an error to the user" do
      expect(page).to have_content "Invalid Email or password"
    end
  end
end
