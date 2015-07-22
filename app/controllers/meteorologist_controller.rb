require 'open-uri'

class MeteorologistController < ApplicationController
  def street_to_weather_form
    # Nothing to do here.
    render("street_to_weather_form.html.erb")
  end

  def street_to_weather
    @street_address = params[:user_street_address]
    url_safe_street_address = URI.encode(@street_address)

    # ==========================================================================
    # Your code goes below.
    # The street address the user input is in the string @street_address.
    # A URL-safe version of the street address, with spaces and other illegal
    #   characters removed, is in the string url_safe_street_address.
    # ==========================================================================
url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + url_safe_street_address

parsed_data = JSON.parse(open(url).read)
@lat = parsed_data["results"][0]["geometry"]["location"]["lat"]
@lng = parsed_data["results"][0]["geometry"]["location"]["lng"]

url = "https://api.forecast.io/forecast/d4496922b5aa2236a0a05a86812b20ed/#{@lat},#{@lng}"
parsed_data = JSON.parse(open(url).read)
    temperature = parsed_data["currently"]["temperature"]
    summary = parsed_data["currently"]["summary"]
    next_hour = parsed_data["minutely"]["summary"]
    next_hours = parsed_data["hourly"]["summary"]
    daily = parsed_data["daily"]["summary"]

    @current_temperature = temperature

    @current_summary = summary

    @summary_of_next_sixty_minutes = next_hour 

    @summary_of_next_several_hours = next_hours

    @summary_of_next_several_days = daily

    render("street_to_weather.html.erb")
  end
end
