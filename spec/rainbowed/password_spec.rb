require "rspec"
require "rainbowed/password"

describe Rainbowed::Password do
  subject { described_class.new(password, provider: provider) }
  let(:password) { "azerty" }
  let(:provider) { double(:provider) }

  describe "#hashed" do
    it { expect(subject.hashed).to eq("ab4f63f9ac65152575886860dde480a1") }
  end

  describe "#found?" do
    let(:provider) { double(:provider, new: searcher) }
    let(:searcher) { double(:searcher, any_result?: :fake_result) }
    it do
      expect(subject.found?).to eq(:fake_result)
    end
  end
end
