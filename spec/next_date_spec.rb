require 'spec_helper'

RSpec.describe NextDate do
  Date::DAYNAMES.each_with_index do |day, index|
    let(day.downcase.to_sym) { index }
  end

  describe 'get the next day by name after a date' do
    it '.next_sunday' do
      expect(Date.next_sunday(after: Date.parse('sunday')).wday).to eq(sunday)
    end
  end

  describe 'get the next day by name' do
    it 'has a version number' do
      expect(NextDate::VERSION).not_to be nil
    end

    it 'gets the next Thursday' do
      current_day = Date.today.next_thursday
      expect(current_day.wday).to be(thursday)
    end

    it 'gets the next Friday' do
      current_day = Date.today.next_friday
      expect(current_day.wday).to be(friday)
    end

    it 'gets the next Sunday' do
      current_day = Date.today.next_sunday
      expect(current_day.wday).to be(sunday)
    end

    it 'gets the next Monday' do
      current_day = Date.today.next_monday
      expect(current_day.wday).to be(monday)
    end

    it 'gets the next Tuesday' do
      current_day = Date.today.next_tuesday
      expect(current_day.wday).to be(tuesday)
    end

    it 'gets the next Wednesday' do
      current_day = Date.today.next_wednesday
      expect(current_day.wday).to be(wednesday)
    end
  end
end
