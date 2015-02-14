require "digest/md5"

module Rainbowed
  class Password
    def initialize(password, provider: GoogleSearch)
      @password = password
      @provider = provider
    end

    def hashed
      Digest::MD5.hexdigest(@password)
    end

    def found?
      @provider.new(hashed).any_result?
    end
  end
end
