require_relative '../../spec_helper'

describe "Conditions" do
  describe "When a user visits /conditions" do
    it "they see a conditions welcome message" do
      visit('/conditions')

      within("h1"){"Conditions"}

      expect(page).to have_content("Conditions")
    end


    it "user can navigate to next page" do
      visit('/conditions')

      within("h1"){expect(page).to have_content("Conditions")}
      expect(page).to_not have_content("Previous Page")
      expect(page).to have_content("Next Page")
    end
  end
end
