require_relative '../spec_helper'

describe "Condition" do
  # breakout into groups of days in 10 degree chunks
  # max temp range : 44 -102

  # Weather.create(date:"12-03-2012", 
  #                 max_temperature_f:102, 
  #                 mean_temperature_f:75, 
  #                 min_temperature_f:44,
  #                 max_dew_point:5,
  #                 mean_dew_point:3,
  #                 min_dew_point:1,
  #                 max_humidity:46,
  #                 mean_humidity:42,
  #                 min_humidity:24,
  #                 max_sea_level_pressure_inches:33,
  #                 mean_sea_level_pressure_inches:25,
  #                 min_sea_level_pressure_inches:20,
  #                 max_visibility_miles:2.4,
  #                 mean_visibility_miles:2.1,
  #                 min_visibility_miles:1.7,
  #                 max_wind_speed_mph:40,
  #                 mean_wind_speed_mph:27,
  #                 min_wind_speed_mph:5,
  #                 max_gust_speed_mph:500,
  #                 precipitation_inches:2,
  #                 cloud_cover:6.0,
  #                 events:"rainy",
  #                 wind_dir_degrees:43,
  #                 zip_code:90210)

  describe ".chunk" do  
    it "returns groups of days by 10 degree - max temp - chunks" do
      Condition.create(date:"12-03-2012", max_temperature_f:102, mean_temperature_f:75, min_temperature_f:44, max_dew_point:5, mean_dew_point:3, min_dew_point:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, min_wind_speed_mph:5, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"12-03-2012", max_temperature_f:91, mean_temperature_f:75, min_temperature_f:44, max_dew_point:5, mean_dew_point:3, min_dew_point:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, min_wind_speed_mph:5, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"12-03-2012", max_temperature_f:85, mean_temperature_f:75, min_temperature_f:44, max_dew_point:5, mean_dew_point:3, min_dew_point:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, min_wind_speed_mph:5, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"12-03-2012", max_temperature_f:20, mean_temperature_f:75, min_temperature_f:44, max_dew_point:5, mean_dew_point:3, min_dew_point:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, min_wind_speed_mph:5, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"12-03-2012", max_temperature_f:86, mean_temperature_f:75, min_temperature_f:44, max_dew_point:5, mean_dew_point:3, min_dew_point:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, min_wind_speed_mph:5, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)

      expect(Condition.chunk(max_temperature_f, 10).keys.count).to eql(4)
    end
  end


end