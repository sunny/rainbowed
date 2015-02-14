require "rspec"

ENV["GOOGLE_API_KEY"] = "F00"
ENV["GOOGLE_SEARCH_CX"] = "B4R"
require "rainbowed/google_search"

describe Rainbowed::GoogleSearch do
  subject { described_class.new(search) }
  let(:search) { "ab4f63f9ac65152575886860dde480a1" }
  let(:results) { { "items" => ["a"] } }

  before do
    allow(GoogleCustomSearchApi).to receive(:search) { results }
  end

  describe "#any_result?" do
    it "calls GoogleCustomSearchApi" do
      subject.any_result?
      expect(GoogleCustomSearchApi).to have_received(:search)
                                         .with(search, num: 1)
                                         .once
    end

    context "when there are no results" do
      let(:results) { { "items" => [] } }
      it { expect(subject.any_result?).to be_falsey }
    end

    context "when there is a result" do
      let(:results) { { "items" => ["a"] } }
      it { expect(subject.any_result?).to be_truthy }
    end

    context "when there is an error" do
      let(:results) { { "error" => { "message" => "Some error" } } }
      it do
        expect do
          subject.any_result?
        end.to raise_error(Rainbowed::GoogleSearchError, "Some error")
      end
    end
  end
end
