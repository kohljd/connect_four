class Cell
    attr_accessor :cell_value

    def initialize
        @cell_value = "."
    end

    def cell_empty?
       if @cell_value == "."
        true
       end
    end
end