require "searchbing"

ENV["BING_API_KEY"] or fail "No BING_API_KEY env found"

module Rainbowed
  class BingSearch
    def initialize(search)
      @search = search
    end

    def any_result?
      results[0][:WebTotal] != "0"
    end

    private

    def results
      @results ||= begin
        web = Bing.new(ENV["BING_API_KEY"], 1, "Web")
        results = web.search(@search)
      end
    end
  end
end
