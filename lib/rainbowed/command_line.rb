module Rainbowed
  class CommandLine
    def initialize(argv)
      @argv = argv
    end

    def call
      abort usage unless password

      rainbowed = Rainbowed::Password.new(password, provider: search_provider)

      puts "Searching for #{rainbowed.hashed}…"
      if rainbowed.found?
        puts "Found! Do not use this as a password. Ever."
        exit 1
      else
        puts "Not found. This password looks ok."
        exit 0
      end
    end

    private

    def password
      @argv.first
    end

    def usage
      "Usage: #{$0} <password>"
    end

    def search_provider
      if env?('BING_API_KEY')
        require "rainbowed/bing_search"
        Rainbowed::BingSearch
      elsif env?('GOOGLE_API_KEY')
        require "rainbowed/google_search"
        Rainbowed::GoogleSearch
      else
        abort "Please use a BING_API_KEY or GOOGLE_API_KEY environment variable."
      end
    end

    def env?(key)
      ENV[key] && ENV[key] != "" && !ENV[key].include?("…")
    end
  end
end
