require "pickaname/version"
require 'timeout'

module Pickaname
  class Error < StandardError; end

  class Robot
    PREFIX      = File.foreach(File.join(File.dirname(__FILE__), 'data', 'prefix.txt')).map { |line| line.split(' ') }
    SUFFIX       = File.foreach(File.join(File.dirname(__FILE__), 'data', 'suffix.txt')).map { |line| line.split(' ') }
    FUNNY       = File.foreach(File.join(File.dirname(__FILE__), 'data', 'funny.txt')).map { |line| line.split(' ') }
    COMMON       = File.foreach(File.join(File.dirname(__FILE__), 'data', 'common.txt')).map { |line| line.split(' ') }
    DARK       = File.foreach(File.join(File.dirname(__FILE__), 'data', 'dark.txt')).map { |line| line.split(' ') }

    FIRSTNAME = File.foreach(File.join(File.dirname(__FILE__), 'data', 'firstname.txt')).map { |line| line.split(' ') }
    LASTNAME = File.foreach(File.join(File.dirname(__FILE__), 'data', 'lastname.txt')).map { |line| line.split(' ') }


    PREFIX_SIZE = 1
    SUFFIX_SIZE  = 1

    TIMEOUT_IN_SECONDS = 5

    attr_reader :name

    def initialize()
      @name = random_str
    end

    # def self.pseudo
    #   @name = PREFIX.sample(PREFIX_SIZE).join << SUFFIX.sample(SUFFIX_SIZE).join
    # end

    def self.common(length: nil)
      begin
        Timeout::timeout(TIMEOUT_IN_SECONDS) do
          @name = COMMON.sample(PREFIX_SIZE).join << COMMON.sample(SUFFIX_SIZE).join
          while length
            break if @name.length == length
            @name = COMMON.sample(PREFIX_SIZE).join << COMMON.sample(SUFFIX_SIZE).join
          end
          return @name
        end
      rescue Timeout::Error
        random_letters(length: length)
      end
    end

    def self.funny(length: nil)
      begin
        Timeout::timeout(TIMEOUT_IN_SECONDS) do
          @name = COMMON.sample(PREFIX_SIZE).join << FUNNY.sample(SUFFIX_SIZE).join
          while length
            break if @name.length == length
            @name = COMMON.sample(PREFIX_SIZE).join << FUNNY.sample(SUFFIX_SIZE).join
          end
          return @name
        end
      rescue Timeout::Error
        random_letters(length: length)
      end
    end

    def self.dark(length: nil)
      begin
        Timeout::timeout(TIMEOUT_IN_SECONDS) do
          @name = COMMON.sample(PREFIX_SIZE).join << DARK.sample(SUFFIX_SIZE).join
          while length
            break if @name.length == length
            @name = COMMON.sample(PREFIX_SIZE).join << DARK.sample(SUFFIX_SIZE).join
          end
          return @name
        end
      rescue Timeout::Error
        random_letters(length: length)
      end
    end

    def self.celebrity(length: nil)
      begin
        Timeout::timeout(TIMEOUT_IN_SECONDS) do
          @name = FIRSTNAME.sample(PREFIX_SIZE).join << LASTNAME.sample(SUFFIX_SIZE).join
          while length
            break if @name.length == length
            @name = FIRSTNAME.sample(PREFIX_SIZE).join << LASTNAME.sample(SUFFIX_SIZE).join
          end
          return @name
        end
      rescue Timeout::Error
        random_letters(length: length)
      end
    end

    def self.random_letters(length: 8)
      record = Robot.new
      begin
        Timeout::timeout(TIMEOUT_IN_SECONDS) do
          @name = record.random_str(length)
          while length
            break if @name.length == length
            @name = record.random_str(length)
          end
          return @name
        end
      rescue Timeout::Error
        puts "Timeout: No results found"
      end
    end

    def random_str(length = 8)
      return Array.new(length){[*"a".."z", *"0".."9"].sample}.join
    end
  end
end
