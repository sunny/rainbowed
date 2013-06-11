module Rainbowed
  class Password
    def initialize(password)
      @password = password
    end

    def hash
      Digest::MD5.hexdigest(@password)
    end

    def found?
      results = GoogleCustomSearchApi.search(hash, num: 1)
      fail "Error #{results["error"]["code"]} #{results["error"]["message"]}" if results["error"]
      results["items"].size != 0
    end
  end
end
