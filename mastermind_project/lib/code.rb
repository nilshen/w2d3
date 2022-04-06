class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs? (chars)
    chars.all?{|c|POSSIBLE_PEGS.has_key?(c.upcase)}
  end 

  def initialize(pegs)
    @pegs = pegs
  
  end

end
