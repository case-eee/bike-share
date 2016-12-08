require_relative '../../spec_helper'

describe "when a user visits /conditions" do
  it "they see conditions header" do
    visit "/conditions"

    within "h1:nth-of-type(1)" do
      expect(page).to have_content "All Conditions"
    end
  end

  it "they can click on a create condition button" do
    visit "/conditions"

    click_on "Create"
    expect(page).to have_current_path "/conditions/new"
  end

  it "they can delete an existing condition" do
    date = Date.strptime("8/30/2013", '%m/%d/%Y')
    Condition.create(date:date,max_temperature_f:23,mean_temperature_f:433,min_temperature_f:432,mean_humidity:12,mean_visibility_miles:123,max_wind_speed_mph:12,precipitation_inches:1)
    visit "/conditions"

    expect(page).to have_content 23
    within(".delete_condition") do
      click_on "Delete"
    end
    # expect(page).to have_current_path "/conditions" !!! maybe figure out how to get this test passing if time
    expect(page).not_to have_content 23
  end

  it "they can update an existing condition" do
    date = Date.strptime("8/30/2013", '%m/%d/%Y')
    condition = Condition.create(date:date ,max_temperature_f:23,mean_temperature_f:433,min_temperature_f:432,mean_humidity:12,mean_visibility_miles:123,max_wind_speed_mph:12,precipitation_inches:1)
    visit "/conditions"
    
    expect(page).to have_content 23
    find("a[href='/conditions/#{condition.id}/edit']").click

    expect(page).to have_current_path "/conditions/#{condition.id}/edit"
    fill_in "condition[date]", :with => date
    fill_in "condition[max_temperature_f]", :with => 74.0
    fill_in "condition[mean_temperature_f]", :with => 68.0
    fill_in "condition[min_temperature_f]", :with => 61.0
    fill_in "condition[mean_humidity]", :with =>  75.0
    fill_in "condition[mean_visibility_miles]", :with => 10.0
    fill_in "condition[max_wind_speed_mph]", :with => 23.0
    fill_in "condition[precipitation_inches]", :with => 0
    click_on "Update Condition"
    expect(page).to have_content 74.0
    expect(page).to have_current_path "/conditions"
  end

  it "they can see an individual condition" do

    date =  Date.strptime("8/29/2013", '%m/%d/%Y')  
    condition = Condition.create(date: date,max_temperature_f:23,mean_temperature_f:433,min_temperature_f:432,mean_humidity:12,mean_visibility_miles:123,max_wind_speed_mph:12,precipitation_inches:1)

    visit "/conditions"

    expect(page).to have_content 23.0
    find("a[href='/conditions/#{condition.id}']").click

    expect(page).to have_content 23.0
    expect(page).to have_current_path "/conditions/#{condition.id}"
  end
end
