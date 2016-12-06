require_relative '../spec_helper'

describe "Conditon" do
  describe "validations" do
    it "validates presence of date" do
      invalid_condition = Condition.new(precipitation_inches: 5,
                                  max_temperature_f: 50, min_temperature_f: 20,
                                  mean_temperature_f: 35, mean_visibility_miles: 10,
                                  mean_wind_speed_mph: 20, mean_humidity: 20)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of max_temperature" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  min_temperature_f: 20,
                                  mean_temperature_f: 35, mean_visibility_miles: 10,
                                  mean_wind_speed_mph: 20, mean_humidity: 20)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of precipitation" do
          invalid_condition = Condition.new(date: '12/01/2000',
                                      max_temperature_f: 50, min_temperature_f: 20,
                                      mean_temperature_f: 35, mean_visibility_miles: 10,
                                      mean_wind_speed_mph: 20, mean_humidity: 20)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of min temperature" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  max_temperature_f: 50,
                                  mean_temperature_f: 35, mean_visibility_miles: 10,
                                  mean_wind_speed_mph: 20, mean_humidity: 20)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of mean_temperature" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  max_temperature_f: 50, min_temperature_f: 20,
                                  mean_visibility_miles: 10,
                                  mean_wind_speed_mph: 20, mean_humidity: 20)
      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of mean visibility" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  max_temperature_f: 50, min_temperature_f: 20,
                                  mean_temperature_f: 35,
                                  mean_wind_speed_mph: 20, mean_humidity: 20)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of mean_wind_speed" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  max_temperature_f: 50, min_temperature_f: 20,
                                  mean_temperature_f: 35, mean_visibility_miles: 10,
                                  mean_humidity: 20)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of mean humidity" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  max_temperature_f: 50, min_temperature_f: 20,
                                  mean_temperature_f: 35, mean_visibility_miles: 10,
                                  mean_wind_speed_mph: 20)

      expect(invalid_condition).to_not be_valid
    end
  end
end
