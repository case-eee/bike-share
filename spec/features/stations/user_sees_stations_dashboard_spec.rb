require_relative '../../spec_helper'

describe "when a user visits /station-dashboard" do
  it "they see total station count" do
    Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1999-10-23')
    Station.create(name:"david",dock_count:30,city_id:3,installation_date:'1999-10-24')
    Station.create(name:"nick",dock_count:30,city_id:4,installation_date:'1999-10-24')

    visit "/station-dashboard"

    expect(page).to have_content(3)
    within(".station_title:nth-of-type(1)") do
      expect(page).to have_content("total stations")
    end
  end

  it "they see average bikes available per station" do
    Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1999-10-23')
    Station.create(name:"david",dock_count:30,city_id:3,installation_date:'1999-10-24')
    Station.create(name:"nick",dock_count:40,city_id:4,installation_date:'1999-10-24')

    visit "/station-dashboard"

    expect(page).to have_content(30)
    within(".station_title:nth-of-type(2)") do
      expect(page).to have_content("average bikes available / station")
    end
  end

  it "they see most bikes available at a station" do
    Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1999-10-23')
    Station.create(name:"david",dock_count:30,city_id:3,installation_date:'1999-10-24')
    Station.create(name:"nick",dock_count:40,city_id:4,installation_date:'1999-10-24')

    visit "/station-dashboard"

    expect(page).to have_content(40)
    within(".station_title:nth-of-type(3)") do
      expect(page).to have_content("most bikes available at a station")
    end
  end

  it "they see fewest bikes available at a station" do
    Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1999-10-23')
    Station.create(name:"david",dock_count:30,city_id:3,installation_date:'1999-10-24')
    Station.create(name:"nick",dock_count:40,city_id:4,installation_date:'1999-10-24')

    visit "/station-dashboard"

    expect(page).to have_content(20)
    within(".station_title:nth-of-type(4)") do
      expect(page).to have_content("fewest bikes available at a station")
    end
  end

  it "they see stations where the most bikes are available" do
    Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1999-10-23')
    Station.create(name:"david",dock_count:40,city_id:3,installation_date:'1999-10-24')
    Station.create(name:"nick",dock_count:40,city_id:4,installation_date:'1999-10-24')

    visit "/station-dashboard"

    expect(page).to have_content("david nick")
    within(".station_title:nth-of-type(5)") do
      expect(page).to have_content("station(s) with most available bikes")
    end
  end

  it "they see stations where the fewest bikes are available" do
    Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1999-10-23')
    Station.create(name:"david",dock_count:20,city_id:3,installation_date:'1999-10-24')
    Station.create(name:"nick",dock_count:40,city_id:4,installation_date:'1999-10-24')

    visit "/station-dashboard"

    expect(page).to have_content("eric david")
    within(".station_title:nth-of-type(6)") do
      expect(page).to have_content("station(s) with fewest available bikes")
    end
  end

  it "they see newest station(s)" do
    Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1999-10-23')
    Station.create(name:"david",dock_count:20,city_id:3,installation_date:'1999-10-24')
    Station.create(name:"nick",dock_count:40,city_id:4,installation_date:'1999-10-24')

    visit "/station-dashboard"

    expect(page).to have_content("david nick")
    within(".station_title:nth-of-type(7)") do
      expect(page).to have_content("newest station(s)")
    end
  end

  it "they see oldest station(s)" do
    Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1999-10-23')
    Station.create(name:"david",dock_count:20,city_id:3,installation_date:'1999-10-23')
    Station.create(name:"nick",dock_count:40,city_id:4,installation_date:'1999-10-24')

    visit "/station-dashboard"

    expect(page).to have_content("eric david")
    within(".station_title:nth-of-type(8)") do
      expect(page).to have_content("oldest station(s)")
    end
  end

end
