require "byebug"
# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  
    def span
        if self.length == 0 
            return nil
        end

        if self.length == 1
            return 0
        end

        new = self.sort { |a,b| b - a}

        return (new[0] - new[-1])
    end

    def average

        if self.length == 0
            return nil
        end

        total = 0

        self.each {|num| total += num}

        total/(self.length * 1.0)

    end

    def median

        if self.length == 0
            return nil
        end

        if self.length % 2 == 0
            new = self.sort { |a,b| a - b}
            x = self.length / 2
            # debugger
            return (new[x] + new[x - 1]) / 2.0
        else
            new = self.sort { |a,b| b - a}
            return new[self.length / 2]
        end
    end

    def counts
        hash = {}

        self.each do |num|
            if !hash[num]
                hash[num] = 1
            else
                hash[num] += 1
            end
        end

        hash

    end

    def my_count(value)

        count = 0

        self.each do |num|
            if num == value
                count += 1
            end
        end
        count
    end


    def my_index(value)
        if self.length == 0 
            return nil
        end

        self.each_with_index do|ele , idx|
            if ele == value
                return idx
            end
        end
        nil
    end

    def my_uniq
        arr = []
        self.each do |ele|
            # debugger
            if !arr.include?(ele)
                arr << ele
            end
        end
           arr
    end

    def my_transpose 
        new_arr = []

        (0...self.length).each do | row |
            arr = []

            (0...self.length).each do | col |
                
                arr << self[col][row]
            end

            new_arr << arr
        end
        new_arr
    end

end


