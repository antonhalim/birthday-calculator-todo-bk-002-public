  require 'pry'
  require 'time'
  require 'date'

class BirthdayCalc

  def initialize(argument)
    @argument = argument.split("/")
    @date = Date._parse('2014-07-14')
    @birth_day = @argument[1].to_i
    @birth_month = @argument[0].to_i
    @birth_year = @argument[2].to_i
  end

  def birthday?
    if @date[:year] >= @birth_year && @date[:mon] == @birth_month && @birth_day == @date[:mday]
      if @date[:mon] == @birth_month && @birth_day == @date[:mday]
        true
      else
        false
      end
    elsif @birth_year > @date[:year]
      raise FutureError
    else
      false
    end
  end

  def age
    if @date[:year] >= @birth_year
      if @date[:mon] == @birth_month && @date[:mday] == @birth_day
          @date[:year] - @birth_year
      elsif @date[:mon] <= @birth_month && @date[:mday] <= @birth_day
          (@date[:year] - @birth_year) -1
        else
          @date[:year] - @birth_year
        end
    else
      raise FutureError
    end
  end

  def number_of_days
     if @birth_year > @date[:year]
        raise FutureError
      else
        next_birthday = Date.new(@date[:year]+1, @birth_month, @birth_day)
        days_remaining = (next_birthday - Date.today).to_i % 365
      end
    end
end

  class BirthdayError < StandardError
    def comment
    "There's an error"
  end
  end

  class FutureError < StandardError
    def comment
      "You are not born yet"
    end
  end
