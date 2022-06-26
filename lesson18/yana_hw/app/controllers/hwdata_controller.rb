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

  def time_work
    date_str = params[:date]
    @date = Time.parse(date_str)

    @curr_date = Time.now
    diff = @date - @curr_date

    @days = (diff / 1.day).to_i
    @hour = (diff / 1.hour).to_i
    @minute = (diff / 1.minute).to_i


    @weeks = (diff / 1.week).to_i
    days_left = diff % 1.week
    @days = (days_left / 1.day).to_i
    hours_left = days_left % 1.day
    @hours = hours_left / 1.hour
    minutes_left = hours_left % 1.hour
    @minutes = minutes_left / 1.minutes

    # 3 weeks 2 days 11 hours 54 min
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
