class Board
    attr_reader (:size)

    def self.print_grid(arr)
        arr.each do |row|
        puts row.join(" ")   
        end
    end

    def initialize(n)
        @num = n
        @grid = Array.new(n){Array.new(n,:N)}
        @size = n * n
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(arr,value)
        @grid[arr[0]][arr[1]] = value
    end

    def num_ships
        @grid.flatten.count(:S) #!!! count is only used for 1 dimension grid. So need to flatten first.
    end

    # def attack(pos)
    #     if self[pos] == :S
    #       self[pos] = :H
    #       puts "you sunk my battleship!"
    #       return true
    #     else
    #       self[pos] = :X
    #       return false
    #     end
    #   end
    
    def attack(arr)
        if self[arr] == :S # use syntactic sugar!!!! if self.[](arr) == :S 
        self[arr] = :H                                 #self.[]=(arr, :H)
        puts "you sunk my battleship!"  #!!!print will be duplicate with the print method on the bottom
        return true
        else 
        self[arr] = :X                                 #self.[]=(arr, :X)
        return false
        end
    end

    def place_random_ships
        # self.attack
        # attack
        n = (@size/4).to_i 
        while self.num_ships < n
        row = rand(1...@num)
        col = rand(1...@num)
        arr = [row,col]
        self[arr] = :S                               #self.[]=(arr, :S)
        end
    end

    def hidden_ships_grid
     @grid.map do |row|
            row.map do |el| 
                if el == :S
                    el = :N
                else el
                end
            end
        end 
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
 

end
