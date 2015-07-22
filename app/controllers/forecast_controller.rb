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

def temp
          require 'open-uri'
          url = "https://api.forecast.io/forecast/5fa7d55c02984ea9bcad2898c1e155c4/#{@lat},#{@lng}"

               parsed_data = JSON.parse(open(url).read)
               temperature = parsed_data["currently"]["temperature"]
    end


    @current_temperature = "Replace this string with your answer."

    @current_summary = "Replace this string with your answer."

    @summary_of_next_sixty_minutes = "Replace this string with your answer."

    @summary_of_next_several_hours = "Replace this string with your answer."

    @summary_of_next_several_days = "Replace this string with your answer."

    render("coords_to_weather.html.erb")
  end
end
