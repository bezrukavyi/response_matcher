require "spec_helper"

RSpec.describe ResponseMatcher do
  it "has a version number" do
    expect(ResponseMatcher::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
