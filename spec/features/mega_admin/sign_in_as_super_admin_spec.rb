describe 'Signing in as super admin', type: :feature, focus: true do
  let(:user) { create(:user, :super_admin_without_organisation) }

  context 'when visiting the home page' do
    it 'shows super admin panel' do
      visit root_path
      sign_in_user user

      expect(page).to have_content("New shiny super admin")
    end
  end
end
