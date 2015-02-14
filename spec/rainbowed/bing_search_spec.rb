require "rspec"

ENV["BING_API_KEY"] = "F00"
require "rainbowed/bing_search"

describe Rainbowed::BingSearch do
  subject { described_class.new(search) }
  let(:search) { "ab4f63f9ac65152575886860dde480a1" }

  let(:bing_search) { double(:bing_search, search: results) }
  let(:results) { [{ :"WebTotal" => "1" }] }

  before do
    allow(Bing).to receive(:new) { bing_search }
  end

  describe "#any_result?" do
    it "calls GoogleCustomSearchApi" do
      subject.any_result?
      expect(Bing).to have_received(:new).with("F00", 1, "Web").once
    end

    context "when there are no results" do
      let(:results) { [{ :"WebTotal" => "0" }] }
      it { expect(subject.any_result?).to be_falsey }
    end

    context "when there is a result" do
      let(:results) { [{ :"WebTotal" => "1" }] }
      it { expect(subject.any_result?).to be_truthy }
    end
  end
end
