require 'pry'
require 'time'
require 'date'

class BirthdayCalc
  attr_reader :birthday, :today, :this_years_birthday

  def initialize(birthday)
    @today = Date.today
    reformatted_birthday = birthday[3..4] + "/" + birthday[0..1]

    @birthday = Date.parse(reformatted_birthday + "/" + birthday[6..-1])
    @this_years_birthday = Date.parse(reformatted_birthday + "/" + today.year.to_s)
  end

  def born_yet?
    if birthday > today
      raise FutureError
    else 
      true
    end
  end

  def age
    if born_yet?
      (today - birthday).to_i / 365
    end
  end

  def calculate_days
    (this_years_birthday - today).to_i.abs
  end

  def number_of_days
    if born_yet?
      if this_years_birthday.month > today.month
        calculate_days
      elsif this_years_birthday.month < today.month
        365 - calculate_days
      else
        if this_years_birthday.day >= today.day
          calculate_days
        else
          365 - calculate_days
        end
      end
    end
  end

end

class FutureError < StandardError

end