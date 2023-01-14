class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(pegs)
    pegs.all? { |peg| POSSIBLE_PEGS.has_key?(peg.upcase) }
  end

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map { |peg| peg.upcase}
    else
      raise "Error"
    end
  end

  def self.random(length)
    pegs = Array.new(length) {POSSIBLE_PEGS.keys.sample}
    Code.new(pegs)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def [](index)
    @pegs[index]
  end

end
