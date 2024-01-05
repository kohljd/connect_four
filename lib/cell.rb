class Cell
    attr_accessor :token, :cell

    def initialize
        @token = nil
        @cell = "."
    end

    def empty?
        @token.nil?
    end

    # #conditional to render cells X, O, or .
    # def assign_player_to_cell
    #     if @token == "X"
    #         # code
    #     elsif @token == "O"
    #         #code
    #     else
    #         @cell
    #     end
    # end
end
        