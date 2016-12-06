require_relative '../spec_helper'

describe "Cities" do
  describe "Validations" do
    it "Can save city" do
      City.write(name: "Testcity1")

      expect(City.find(1).name).to eq("Testcity1")
    end
    it "Will not save city without a name" do
      invalid_city = City.new()

      expect(invalid_city).to_not be_valid
    end
    it "Will not save city if there is one with the same name already in the table" do
      first_city = City.write(name: "FirstCity")
      invalid_city = City.write(name: "FirstCity")

      expect(City.all.count).to eq(1)
    end
  end
end