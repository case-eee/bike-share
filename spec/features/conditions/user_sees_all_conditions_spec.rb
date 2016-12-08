require_relative '../../spec_helper'

describe "Conditions" do
  describe "When a user visits /conditions" do
    it "they see a conditions welcome message" do
      visit('/conditions')

      within("h1"){"Conditions"}

      expect(page).to have_content("Conditions")
    end


    it "user cannot navigate to previous page from page one" do
      visit('/conditions')

      within("h1"){expect(page).to have_content("Conditions")}
    end
  end
end
