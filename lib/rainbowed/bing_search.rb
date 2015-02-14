require "searchbing"

module Rainbowed
  class BingSearch
    def initialize(search)
      @search = search
    end

    def results
      fail "No BING_API_KEY env found" unless ENV["BING_API_KEY"]

      @results ||= begin
        web = Bing.new(ENV["BING_API_KEY"], 1, "Web")
        results = web.search(@search)
      end
    end

    def any_result?
      results[0][:WebTotal] != "0"
    end
  end
end
