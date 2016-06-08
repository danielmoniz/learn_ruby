
def translate(text)
  words = text.split
  pigged_words = words.map do |word|
    chunk_to_move, remainder = get_word_segments(word)
    next remainder + chunk_to_move + 'ay'
  end

  pigged_words.join(' ')
end

def get_word_segments(word)
  vowels = ['a', 'e', 'i', 'o', 'u']

  segment = ''
  word.split('').each do |letter|
    if vowels.include? letter
      if letter == 'u' and segment[-1] == 'q'
        segment << letter
      end
      break
    end
    segment << letter
  end
  return segment, word[segment.size..-1]
end
