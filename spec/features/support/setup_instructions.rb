shared_examples "shows the setup instructions page" do
  it "shows the user the setup instructions page" do
    expect(page).to have_selector("h2", text: "Settings")
  end
end
