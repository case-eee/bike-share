describe "When a user visits /trips" do
  it "they see all the stations" do
    visit '/trips'

    expect(page).to have_content("All Trips")
  end
end