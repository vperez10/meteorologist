require 'open-uri'

class ForecastController < ApplicationController
  def coords_to_weather_form
    # Nothing to do here.
    render("coords_to_weather_form.html.erb")
  end

  def coords_to_weather
    @lat = params[:user_latitude]
    @lng = params[:user_longitude]

    # ==========================================================================
    # Your code goes below.
    # The latitude the user input is in the string @lat.
    # The longitude the user input is in the string @lng.
    # ==========================================================================

    require 'open-uri'
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

    render("coords_to_weather.html.erb")
  end
end
