require_relative '../spec_helper'

describe "Dashboard Features" do

  describe "When user accesses trips dashboard page" do

    it "they see the average ride duration" do
      Trip.write(Trip.create(duration: 45,
                        start_date: "2011-3-6 12:00",
                        start_station_id: 1,
                        end_date: "2011-3-6 12:00",
                        end_station_id: 3,
                        bike_id: 3,
                        subscription_id: 1,
                        zipcode: 80211)
      Trip.write(Trip.create(duration: 60,
                        start_date: "2011-4-6 12:00",
                        start_station_id: 1,
                        end_date: "2011-4-6 12:33",
                        end_station_id: 4,
                        bike_id: 4,
                        subscription_id: 1,
                        zipcode: 80212)
      visit "/stations-dashboard"

      within('tr:nth-of-type(1)') do
        within('td:nth-of-type(1)') do
          expect(page).to have_content("Average Ride Duration")
        end
        within('tr:nth-of-type(1)') do
          within('td:nth-of-type(2)') do
          expect(page).to have_content("#{Trip.average_duration_of_a_ride}")
        end
      end

      it "they see the longest ride duration" do
        Trip.write(Trip.create(duration: 45,
                          start_date: "2011-3-6 12:00",
                          start_station_id: 1,
                          end_date: "2011-3-6 12:00",
                          end_station_id: 3,
                          bike_id: 3,
                          subscription_id: 1,
                          zipcode: 80211)
        Trip.write(Trip.create(duration: 60,
                          start_date: "2011-4-6 12:00",
                          start_station_id: 1,
                          end_date: "2011-4-6 12:33",
                          end_station_id: 4,
                          bike_id: 4,
                          subscription_id: 1,
                          zipcode: 80212)
        visit "/stations-dashboard"

        within('tr:nth-of-type(2)') do
          within('td:nth-of-type(1)') do
            expect(page).to have_content("Longest Ride")
          end
          within('tr:nth-of-type(2)') do
            within('td:nth-of-type(2)') do
            expect(page).to have_content("#{Trip.longest_ride}")
          end
        end


        it "they see the shortest ride duration" do
          Trip.write(Trip.create(duration: 45,
                            start_date: "2011-3-6 12:00",
                            start_station_id: 1,
                            end_date: "2011-3-6 12:00",
                            end_station_id: 3,
                            bike_id: 3,
                            subscription_id: 1,
                            zipcode: 80211)
          Trip.write(Trip.create(duration: 60,
                            start_date: "2011-4-6 12:00",
                            start_station_id: 1,
                            end_date: "2011-4-6 12:33",
                            end_station_id: 4,
                            bike_id: 4,
                            subscription_id: 1,
                            zipcode: 80212)
          visit "/stations-dashboard"

          within('tr:nth-of-type(3)') do
            within('td:nth-of-type(1)') do
              expect(page).to have_content("Shortest Ride")
            end
            within('tr:nth-of-type(3)') do
              within('td:nth-of-type(2)') do
              expect(page).to have_content("#{Trip.shortest_ride}")
            end
          end


          it "they see the station with most rides as a starting point" do
            Trip.write(Trip.create(duration: 45,
                              start_date: "2011-3-6 12:00",
                              start_station_id: 1,
                              end_date: "2011-3-6 12:00",
                              end_station_id: 3,
                              bike_id: 3,
                              subscription_id: 1,
                              zipcode: 80211)
            Trip.write(Trip.create(duration: 60,
                              start_date: "2011-4-6 12:00",
                              start_station_id: 1,
                              end_date: "2011-4-6 12:33",
                              end_station_id: 4,
                              bike_id: 4,
                              subscription_id: 1,
                              zipcode: 80212)
            visit "/stations-dashboard"

            within('tr:nth-of-type(4)') do
              within('td:nth-of-type(1)') do
                expect(page).to have_content("Station with Most Starting Rides")
              end
              within('tr:nth-of-type(4)') do
                within('td:nth-of-type(2)') do
                expect(page).to have_content("#{Trip.station_with_most_rides_as_starting_place}")
              end
            end

            it "they see the station with most rides as a starting point" do
              Trip.write(Trip.create(duration: 45,
                                start_date: "2011-3-6 12:00",
                                start_station_id: 1,
                                end_date: "2011-3-6 12:00",
                                end_station_id: 3,
                                bike_id: 3,
                                subscription_id: 1,
                                zipcode: 80211)
              Trip.write(Trip.create(duration: 60,
                                start_date: "2011-4-6 12:00",
                                start_station_id: 1,
                                end_date: "2011-4-6 12:33",
                                end_station_id: 4,
                                bike_id: 4,
                                subscription_id: 1,
                                zipcode: 80212)
              visit "/stations-dashboard"

              within('tr:nth-of-type(5)') do
                within('td:nth-of-type(1)') do
                  expect(page).to have_content("Station with Most Ending Rides")
                end
                within('tr:nth-of-type(5)') do
                  within('td:nth-of-type(2)') do
                  expect(page).to have_content("#{Trip.most_frequent_destination_station}")
                end
              end

    end
