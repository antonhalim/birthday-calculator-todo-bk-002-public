require_relative 'spec_helper'

describe BirthdayCalc do

  let(:past) {BirthdayCalc.new("07/20/1989")}
  let(:katie) {BirthdayCalc.new("06/18/1990")}

  let(:future) {BirthdayCalc.new("12/28/2090")}

  let(:present) {BirthdayCalc.new("07/14/2014")}

  describe '#age' do
    it 'gives age of someone born in the past' do
      expect(past.age).to eq(25)
    end
    it 'gives age of someone born in the past' do
      expect(katie.age).to eq(24)
    end
    it 'gives age of someone born in the current year' do
      expect(present.age).to eq(0)
    end
    it 'raises error when birthday is in the future' do
      expect{ future.age }.to raise_error(FutureError)
    end
  end

  describe '#number_of_days' do
    it 'gives number of days until a given date' do
      expect(past.number_of_days).to eq(6)
    end
    it 'gives number of days until a given date next year' do
      expect(katie.number_of_days).to eq(339)
    end
    it 'gives number of days until a given date' do
      expect(present.number_of_days).to eq(0)
    end
    it 'raises error when birthday is in the future' do
      expect{ future.number_of_days }.to raise_error
    end
  end

end
