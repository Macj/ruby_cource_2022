require 'time'
require 'date'
#require "../../app/helpers/hwdata_helper"

class HwdataController < ApplicationController
  include HwdataHelper

  def home_work
    str = params[:event_line]
    @date, @name = parse_data(str)
    @days = days_to(@date)
    @hours = hours_to(@date)
  end

  private
  def parse_data(str)
    date_str, name = str.split("|")
    date = Time.parse(date_str)
    [date, name]
  end

  def days_to(date)
    (Date.parse(date.to_s) - Date.today).round
  end

  def hours_to(date)
    time_difference = date - now
    (time_difference.to_i / hour)
  end
end
