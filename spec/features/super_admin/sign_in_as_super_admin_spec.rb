describe 'Signing in as a super admin', type: :feature do
  let(:user) { create(:user, :super_admin) }

  context 'when visiting the home page' do
    before do
#      create(:organisation, name: "Gov Org 2")
      sign_in_user user
      visit root_path
    end

    it 'shows super admin panel' do
      expect(page).to have_content("New shiny super admin")
    end
  end
end
