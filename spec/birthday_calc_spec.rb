require_relative 'spec_helper'

describe BirthdayCalc do

  let(:past)                {BirthdayCalc.new("07/20/1989")}
  let(:katie)               {BirthdayCalc.new("06/18/1989")}
  let(:future)              {BirthdayCalc.new("12/28/2090")}
  let(:present)             {BirthdayCalc.new("07/14/2014")}
  let(:bd_today)            {BirthdayCalc.new("07/14/2000")}
  let(:tomorrow)            {BirthdayCalc.new("07/15/2000")}
  let(:day_after_tomorrow)  {BirthdayCalc.new("07/16/2000")}
  let(:yesterday)           {BirthdayCalc.new("07/13/2000")}

  describe '#birthday?' do
    it 'returns true if it is the month and day and year of birthday' do
      expect(present.birthday?).to eq(true)
    end
    it 'returns true if it is the month and day of the birthday' do
      expect(bd_today.birthday?).to eq(true)
    end
    it 'raises error when birthday is in the future' do
      expect{ future.birthday? }.to raise_error
    end
    it 'returns false if it is not the month and day of the birthday' do
      expect(past.birthday?).to eq(false)
    end
    it 'returns false if it is not the month and day of the birthday'  do
      expect(katie.birthday?).to eq(false)
    end
    it 'returns false if it is not the month and day of the birthday' do
      expect(tomorrow.birthday?).to eq(false)
    end
    it 'returns false if it is not the month and day of the birthday' do
      expect(yesterday.birthday?).to eq(false)
    end
  end
  
  describe '#age' do
    it 'gives age of someone born in the past whose birthday is in the current month but has not yet come to pass' do
      expect(past.age).to eq(24)
    end
    it 'gives age of someone born in the current year, current month, and current day' do
      expect(present.age).to eq(0)
    end
    it 'gives age of someone born fourteeen years ago from yesterday' do
      expect(yesterday.age).to eq(14)
    end
    it 'gives age of someone born in the past whose birthday is in a month that passed already' do
      expect(katie.age).to eq(25)
    end
    it 'gives age of someone whose birthday is the current month and current day' do
      expect(bd_today.age).to eq(14)
    end
    it 'gives age of someone whose birthday is tomorrow' do
      expect(tomorrow.age).to eq(13)
    end
    it 'gives age of someone with a birthday the day after tomorrow' do
      expect(day_after_tomorrow.age).to eq(13)
    end
    it 'raises error when birthday is in the future' do
      expect{ future.age }.to raise_error(FutureError)
    end
  end

  describe '#number_of_days' do
    it "gives a number one when someone's birthday is tomorrow" do
      expect(tomorrow.number_of_days).to eq(1)
    end
    it 'gives number of days until an upcoming birthday' do
      expect(past.number_of_days).to eq(6)
    end
    it 'gives number of days until a birthday for that month and day' do
      expect(present.number_of_days).to eq(0)
    end
    it 'gives number of days until a birthday for that month and day' do
      expect(bd_today.number_of_days).to eq(0)
    end
    it 'gives number of days until an upcoming birthday, accounting for the fact that it may be the next calendar year' do
      expect(yesterday.number_of_days).to eq(364)
    end
    it 'gives number of days until an upcoming birthday, accounting for the fact that it may be the next calendar year' do
      expect(katie.number_of_days).to eq(339)
    end
    it 'raises error when birthday is in the future' do
      expect{ future.number_of_days }.to raise_error
    end
  end


end
