require "google_custom_search_api"

GOOGLE_API_KEY = ENV["GOOGLE_API_KEY"] or fail "No GOOGLE_API_KEY env found"
GOOGLE_SEARCH_CX = ENV["GOOGLE_SEARCH_CX"] or fail "No GOOGLE_SEARCH_CX env found"

module Rainbowed
  class GoogleSearchError < RuntimeError; end

  class GoogleSearch
    def initialize(search)
      @search = search
    end

    def any_result?
      fail GoogleSearchError, results["error"]["message"] if results["error"]
      results["items"].any?
    end

    private

    def results
      @results ||= GoogleCustomSearchApi.search(@search, num: 1)
    end
  end
end
