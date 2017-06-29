require "spec_helper"

RSpec.describe CanCanExplainer do
  it "has a version number" do
    expect(CanCanExplainer.gem_version).to be_a(Gem::Version)
  end
end
