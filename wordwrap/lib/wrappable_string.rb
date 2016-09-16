class WrappableString
  def initialize(string)
    @string = string
  end

  def wrap(break_on)
    line_length = 0

    words.reduce('') do |wrapped, word|
      if should_wrap?(word, line_length, break_on)
        add_line_break(wrapped, word, line_length).tap do
          line_length = 0
        end
      else
        line_length += word.length + 1
        add_space(wrapped, word)
      end
    end.strip
  end

  def words
    string.split(" ")
  end

  private

  def should_wrap?(word, current_line_length, break_on)
    (current_line_length + word.length) >= break_on
  end

  def add_line_break(wrapped, word, line_length)
    wrapped.strip! unless wrapped.empty?
    wrapped << "\n" << word

    if word.length > line_length
      wrapped << "\n"
    end

    wrapped
  end

  def add_space(wrapped, word)
    wrapped << word << " "
  end

  attr_reader :string
end
