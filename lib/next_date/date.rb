module NextDate
  module Date
    def self.included(base)
      base.class_eval do
        ::Date::DAYNAMES.each_with_index do |day, index|
          next_day = "next_#{day.downcase}"
          define_singleton_method next_day do |after: ::Date.today|
            if after.wday > index
                after += 7 + (index - after.wday)
            elsif after.wday < index
                after += 7 - (after.wday - index)
            else
                after += 7
            end
          end

          define_method next_day do
            self.class.send(next_day, after: self)
          end
        end
      end
    end
  end
end

class Date
  include NextDate::Date
end
