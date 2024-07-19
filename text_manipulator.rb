class TextManipulator
  attr_accessor :corpus, :commands, :cursor_position, :command_buffer, :result, :n_value

  RULES = {
    'h' => -> (instance) do
      n_value = instance.n_value || 1
  
      instance.cursor_position -= n_value
      if instance.cursor_position < 0
        instance.cursor_position = 0
      end
    end,
    'l' => -> (instance) do
      n_value = instance.n_value || 1

      instance.cursor_position += n_value

      if instance.cursor_position >= instance.corpus.length
        instance.cursor_position = instance.corpus.length - 1 
      end
    end,
    'r' => -> (instance) do
      character_to_replace = instance.command_buffer.shift
      current_cursor_position = instance.cursor_position
      instance.result[current_cursor_position] = character_to_replace
    end
  }

  def initialize(corpus, commands)
    @corpus = corpus
    @commands = commands
    @cursor_position = 0
    @command_buffer = commands.chars
    @result = corpus
    @n_value = nil
  end

  def call
    until @command_buffer.empty? do
      character = @command_buffer.shift

      if ('0'..'9').include?(character)
        @n_value = character.to_i
      else
        RULES[character].call(self)
        @n_value = nil
      end
    end

    return {
      cursor: @cursor_position,
      output_string: @corpus
    }
  end
end
