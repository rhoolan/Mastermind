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

  def length
    @pegs.length
  end

  def num_exact_matches(guess_code)
    matches = 0

    (0...guess_code.length).each do |i|
      matches += 1 if guess_code[i] == self[i]
    end

    matches
  end

  def num_near_matches(guess_code)
    guess_code_dupe = guess_code.pegs.dup
    pegs_dupe = @pegs.dup

    matches = 0

    (0...guess_code_dupe.length).each do |i|
      if guess_code_dupe[i] == pegs_dupe[i]
        guess_code_dupe[i] = nil
        pegs_dupe[i] = nil
      end
    end

    (0...guess_code_dupe.length).each do |i1|
      if (guess_code_dupe[i1] != nil && pegs_dupe[i1] != nil) && pegs_dupe.include?(guess_code_dupe[i1])
        matches += 1 

        (0...pegs_dupe.length).each do |i2|
          if pegs_dupe[i2] == guess_code_dupe[i1]
            pegs_dupe[i2] = nil
            break
          end
        end
      end
    end

    matches
  end

end
