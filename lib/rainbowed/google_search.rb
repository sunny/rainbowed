require "google_custom_search_api"

GOOGLE_API_KEY = ENV["GOOGLE_API_KEY"] or fail "No GOOGLE_API_KEY env found"
GOOGLE_SEARCH_CX = ENV["GOOGLE_SEARCH_CX"] or fail "No GOOGLE_SEARCH_CX env found"

module Rainbowed
  class GoogleSearch
    def initialize(search)
      @search = search
    end

    def results
      @results ||= GoogleCustomSearchApi.search(@search, num: 1)
    end

    def any_result?
      fail results["error"]["message"] if results["error"]
      results["items"].any?
    end
  end
end
