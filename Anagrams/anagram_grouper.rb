class AnagramGrouper
  def group()
    groups = keep_groups_larger_than_one(group_words(import('wordlist.txt')))

    pp groups[50..150]

    groups
  end

  def group_words(words)
    words.reduce({}) do |word_hash, word|
      word = sanitize(word)
      sorted = sort_word(word)

      unless word_hash.has_key?(sorted)
        word_hash[sorted] = []
      end

      unless word_hash[sorted].include?(word)
        word_hash[sorted] << word.strip
      end

      word_hash
    end.values
  end

  def import(filename)
    File.open(filename).to_a
  end

  def sort_word(word)
    word.split('').sort.join
  end

  def sanitize(word)
    word.gsub('\'s', '').gsub(/[^a-zA-Z]+/, '').downcase
  end

  def keep_groups_larger_than_one(groups)
    groups.keep_if { |g| g.count > 1 }
  end
end
