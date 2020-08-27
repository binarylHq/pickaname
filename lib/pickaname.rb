require "pickaname/version"

module Pickaname
  class Error < StandardError; end

  class Robot
    PREFIX      = File.foreach(File.join(File.dirname(__FILE__), '.', 'data', 'prefix.txt')).map { |line| line.split(' ') }
    SUFFIX       = File.foreach(File.join(File.dirname(__FILE__), '.', 'data', 'suffix.txt')).map { |line| line.split(' ') }
    FUNNY       = File.foreach(File.join(File.dirname(__FILE__), '.', 'data', 'funny.txt')).map { |line| line.split(' ') }
    PREFIX_SIZE = 1
    SUFFIX_SIZE  = 1

    attr_reader :name

    def initialize()
      @name = random_string
    end

    def self.pseudo
      @name = PREFIX.sample(PREFIX_SIZE).join << SUFFIX.sample(SUFFIX_SIZE).join
    end

    def self.funny
      @name = FUNNY.sample(PREFIX_SIZE).join << FUNNY.sample(SUFFIX_SIZE).join
    end

    def self.random(record = Robot.new)
      @name = record.random_string
    end

    def random_string
      down   = ('a'..'z').to_a
      up     = ('A'..'Z').to_a
      digits = ('0'..'9').to_a
      [extract1(down), extract1(up), extract1(digits)].
        concat(((down+up+digits).sample(8))).shuffle.join
    end

    def extract1(arr)
      i = arr.size.times.to_a.sample
      c = arr[i]
      arr.delete_at(i)
      c
    end
  end
end
