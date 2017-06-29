require "spec_helper"

class Banana
  attr_reader :color
  def initialize(color)
    @color = color
  end
end

class Ability
  include CanCan::Ability
  def initialize(user)
    can :eat, Banana
    cannot :eat, Banana, color: "green"
  end
end

RSpec.describe CanCanExplainer do
  it "has a version number" do
    expect(CanCanExplainer.gem_version).to be_a(Gem::Version)
  end

  it "explains green bananas" do
    green_banana = Banana.new("green")
    yellow_banana = Banana.new("yellow")
    ability = Ability.new(nil)
    expect(ability.can?(:eat, yellow_banana)).to eq(true)
    expect(ability.can?(:eat, green_banana)).to eq(false)
    result = CanCanExplainer.explain { ability.can? :eat, green_banana }.to_s
    expect(result).to start_with("eat")
    expect(result).to include("spec/cancan_explainer_spec.rb:14")
  end
end
