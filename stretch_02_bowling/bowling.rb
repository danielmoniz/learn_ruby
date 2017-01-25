class Game

  def score(rolls)
    score = 0
    frames = self.get_frames(rolls)
    bonus_rolls_remaining = []

    frames.each.with_index do |frame, i|
      score += frame.reduce(:+)
      frame.each do |roll|
        bonus_rolls_remaining.map! do |bonus|
          score += roll if bonus > 0
          next bonus - 1
        end
      end
      bonus_rolls_remaining.select! { |x| x > 0 }

      if frame[0] == 10 # strike
        bonus_rolls_remaining << 2
      elsif frame[0..1].reduce(:+) == 10 # spare
        bonus_rolls_remaining << 1
      end

    end

    return score
  end

  def get_frames(rolls)
    frames = []
    sum = 0
    num_rolls = 0
    frame = []
    rolls.each do |roll|
      frame << roll
      sum += roll
      num_rolls += 1
      if frames.length == 10
        frames[-1] << roll
      elsif sum == 10 || (num_rolls == 2)
        frames << frame
        frame = []
        sum = 0
        num_rolls = 0
      else

      end
    end
    return frames
  end
end
