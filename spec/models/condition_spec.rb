require_relative '../spec_helper'

describe "Conditon" do
  it "finds conditions that ocurr in max temperature 10 degree ranges" do
    Condition.create(date: '2000-01-01', precipitation_inches: 5,
                     max_temperature_f: 52, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 10,
                     mean_wind_speed_mph: 20, mean_humidity: 20,
                     zip_code: 94107)
    Condition.create(date: '2000-02-02', precipitation_inches: 5,
                     max_temperature_f: 59, min_temperature_f: 20,
                     mean_temperature_f: 3, mean_visibility_miles: 10,
                     mean_wind_speed_mph: 20, mean_humidity: 20,
                     zip_code: 94107)
    Condition.create(date: '2000-03-03', precipitation_inches: 5,
                     max_temperature_f: 40, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 10,
                     mean_wind_speed_mph: 20, mean_humidity: 20,
                     zip_code: 94107)

    expect((Condition.max_temperature_range(50)).ids).to eq([1,2])
    expect((Condition.max_temperature_range(40).ids)).to eq([3])
  end

  it "find conditions that ocurr in half inch precipitation range" do
    Condition.create(date: '2000-01-01', precipitation_inches: 0.0,
                     max_temperature_f: 52, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 10,
                     mean_wind_speed_mph: 20, mean_humidity: 20,
                     zip_code: 94107)
    Condition.create(date: '2000-02-02', precipitation_inches: 0.4,
                     max_temperature_f: 59, min_temperature_f: 20,
                     mean_temperature_f: 3, mean_visibility_miles: 10,
                     mean_wind_speed_mph: 20, mean_humidity: 20,
                     zip_code: 94107)
    Condition.create(date: '2000-03-03', precipitation_inches: 0.5,
                     max_temperature_f: 40, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 10,
                     mean_wind_speed_mph: 20, mean_humidity: 20,
                     zip_code: 94107)
    Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                     max_temperature_f: 40, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 10,
                     mean_wind_speed_mph: 20, mean_humidity: 20,
                     zip_code: 94107)

    expect(Condition.precipitation_in_half_inch_increments(0.0)).to eq([1,2])
    expect(Condition.precipitation_in_half_inch_increments(0.5)).to eq([3,4])

  end

  describe 'to find number of rides based on mean wind speed' do
    it 'finds conditions that occur within mean wind speed chunks of 4' do

    Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                     max_temperature_f: 40, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 10,
                     mean_wind_speed_mph: 6, mean_humidity: 20,
                     zip_code: 94107)

    Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                     max_temperature_f: 40, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 10,
                     mean_wind_speed_mph: 3, mean_humidity: 20,
                     zip_code: 94107)

    Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                     max_temperature_f: 40, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 10,
                     mean_wind_speed_mph: 2, mean_humidity: 20,
                     zip_code: 94107)

    Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                     max_temperature_f: 40, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 10,
                     mean_wind_speed_mph: 7, mean_humidity: 20,
                     zip_code: 94107)

    expect(Condition.wind_speed_in_4_mph_chunks(0)).to eq([2,3])
    expect(Condition.wind_speed_in_4_mph_chunks(4)).to eq([1,4])
    end
  end

  describe "to find rides that occur with mean visibility in 4 mile chunks" do
    it 'finds conditions ids that have mean wind speed in 4 mile chunks' do
    Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                     max_temperature_f: 40, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 3,
                     mean_wind_speed_mph: 7, mean_humidity: 20,
                     zip_code: 94107)

    Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                     max_temperature_f: 40, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 6,
                     mean_wind_speed_mph: 7, mean_humidity: 20,
                     zip_code: 94107)

    Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                     max_temperature_f: 40, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 2,
                     mean_wind_speed_mph: 7, mean_humidity: 20,
                     zip_code: 94107)

    Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                     max_temperature_f: 40, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 5,
                     mean_wind_speed_mph: 7, mean_humidity: 20,
                     zip_code: 94107)

    expect(Condition.visibility_in_4_mile_chunks(0)).to eq([1,3])
    expect(Condition.visibility_in_4_mile_chunks(4)).to eq([2,4])
    end
  end

  describe "validations" do
    it "validates presence of date" do
      invalid_condition = Condition.new(precipitation_inches: 5,
                                  max_temperature_f: 50, min_temperature_f: 20,
                                  mean_temperature_f: 35, mean_visibility_miles: 10,
                                  mean_wind_speed_mph: 20, mean_humidity: 20,
                                  zip_code: 94107)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of max_temperature" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  min_temperature_f: 20,
                                  mean_temperature_f: 35, mean_visibility_miles: 10,
                                  mean_wind_speed_mph: 20, mean_humidity: 20,
                                  zip_code: 94107)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of precipitation" do
          invalid_condition = Condition.new(date: '12/01/2000',
                                      max_temperature_f: 50, min_temperature_f: 20,
                                      mean_temperature_f: 35, mean_visibility_miles: 10,
                                      mean_wind_speed_mph: 20, mean_humidity: 20,
                                      zip_code: 94107)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of min temperature" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  max_temperature_f: 50,
                                  mean_temperature_f: 35, mean_visibility_miles: 10,
                                  mean_wind_speed_mph: 20, mean_humidity: 20,
                                  zip_code: 94107)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of mean_temperature" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  max_temperature_f: 50, min_temperature_f: 20,
                                  mean_visibility_miles: 10,
                                  mean_wind_speed_mph: 20, mean_humidity: 20,
                                  zip_code: 94107)
      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of mean visibility" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  max_temperature_f: 50, min_temperature_f: 20,
                                  mean_temperature_f: 35,
                                  mean_wind_speed_mph: 20, mean_humidity: 20,
                                  zip_code: 94107)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of mean_wind_speed" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  max_temperature_f: 50, min_temperature_f: 20,
                                  mean_temperature_f: 35, mean_visibility_miles: 10,
                                  mean_humidity: 20, zip_code: 94107)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of mean humidity" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  max_temperature_f: 50, min_temperature_f: 20,
                                  mean_temperature_f: 35, mean_visibility_miles: 10,
                                  mean_wind_speed_mph: 20, zip_code: 94107)

      expect(invalid_condition).to_not be_valid
    end
  end
end
