require "pickaname/version"

module Pickaname
  class Error < StandardError; end

  class Robot
    PREFIX      = File.foreach("lib/data/prefix.txt").map { |line| line.split(' ') }
    SUFFIX       = File.foreach("lib/data/suffix.txt").map { |line| line.split(' ') }
    PREFIX_SIZE = 1
    SUFFIX_SIZE  = 1

    attr_reader :name

    def initialize()
      @name = pseudo_name
    end

    def self.pseudo
      @name = PREFIX.sample(PREFIX_SIZE).join << SUFFIX.sample(SUFFIX_SIZE).join
    end

  end
end
