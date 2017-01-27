class Game
  def score(rolls, frame=1)
    return rolls[0..-1].reduce(:+) if frame == 10
    puts rolls.to_s
    if rolls[0] == 10
      # strike
      return rolls[0..2].reduce(:+) + self.score(rolls[1..-1], frame + 1)
    elsif rolls[0..1].reduce(:+) == 10
      # spare
      return rolls[0..2].reduce(:+) + self.score(rolls[2..-1], frame + 1)
    else
      # normal frame
      return rolls[0..1].reduce(:+) + self.score(rolls[2..-1], frame + 1)
    end
  end
end
