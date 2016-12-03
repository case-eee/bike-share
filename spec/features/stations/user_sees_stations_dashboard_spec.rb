require_relative '../../spec_helper'

describe "when a user visits /station-dashboard" do
  it "they see total station count" do
    Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1999-10-23')
    Station.create(name:"david",dock_count:30,city_id:3,installation_date:'1999-10-24')
    Station.create(name:"nick",dock_count:30,city_id:4,installation_date:'1999-10-24')

    visit "/station-dashboard"

    expect(page).to have_content("total stations: 3")
  end

  it "they see average bikes available per station" do
    Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1999-10-23')
    Station.create(name:"david",dock_count:30,city_id:3,installation_date:'1999-10-24')
    Station.create(name:"nick",dock_count:40,city_id:4,installation_date:'1999-10-24')

    visit "/station-dashboard"

    expect(page).to have_content("average bikes available / station : 30")
  end

  it "they see most bikes available at a station" do
    Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1999-10-23')
    Station.create(name:"david",dock_count:30,city_id:3,installation_date:'1999-10-24')
    Station.create(name:"nick",dock_count:40,city_id:4,installation_date:'1999-10-24')

    visit "/station-dashboard"

    expect(page).to have_content("most bikes available at a station: 40")
  end

  it "they see fewest bikes available at a station" do
    Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1999-10-23')
    Station.create(name:"david",dock_count:30,city_id:3,installation_date:'1999-10-24')
    Station.create(name:"nick",dock_count:40,city_id:4,installation_date:'1999-10-24')

    visit "/station-dashboard"

    expect(page).to have_content("fewest bikes available at a station: 20")
  end

  it "they see stations where the most bikes are available" do
    Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1999-10-23')
    Station.create(name:"david",dock_count:40,city_id:3,installation_date:'1999-10-24')
    Station.create(name:"nick",dock_count:40,city_id:4,installation_date:'1999-10-24')

    visit "/station-dashboard"

    expect(page).to have_content("station(s) with the most bikes available: david nick")
  end

  it "they see stations where the fewest bikes are available" do
    Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1999-10-23')
    Station.create(name:"david",dock_count:20,city_id:3,installation_date:'1999-10-24')
    Station.create(name:"nick",dock_count:40,city_id:4,installation_date:'1999-10-24')

    visit "/station-dashboard"

    expect(page).to have_content("station(s) with the fewest bikes available: eric david")
  end

  it "they see newest station(s)" do
    Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1999-10-23')
    Station.create(name:"david",dock_count:20,city_id:3,installation_date:'1999-10-24')
    Station.create(name:"nick",dock_count:40,city_id:4,installation_date:'1999-10-24')

    visit "/station-dashboard"

    expect(page).to have_content("newest station(s): david nick")
  end

  it "they see oldest station(s)" do
    Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1999-10-23')
    Station.create(name:"david",dock_count:20,city_id:3,installation_date:'1999-10-23')
    Station.create(name:"nick",dock_count:40,city_id:4,installation_date:'1999-10-24')

    visit "/station-dashboard"

    expect(page).to have_content("oldest station(s): eric david")
  end


end
