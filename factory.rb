# frozen_string_literal: true

class User
  attr_reader :args

  def initialize(args)
    @args = args
  end

  def talk
    'U can\'t touch me'
  end
end

class NiceGuy < User
  def talk
    puts "I say nice words like: #{args[:first_nice_word]} or #{args[:second_nice_word]}"
  end
end

class BadGuy < User
  def talk
    puts "I say bad words like: #{args[:first_bad_word]}"
  end
end

class Factory
  def self.build(user_type, args)
    case user_type
    when :nice
      NiceGuy.new(args)
    when :bad
      BadGuy.new(args)
    end
  end
end

nice_guy = Factory.build(:nice, { first_nice_word: 'beautiful', second_nice_word: 'wonderful' })
bad_guy = Factory.build(:bad, { first_bad_word: 'ugly' })

nice_guy.talk
bad_guy.talk
