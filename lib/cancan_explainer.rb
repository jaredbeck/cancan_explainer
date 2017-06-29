require "cancan_explainer/version"
require "cancan_explainer/cancan_extensions"
require "cancan_explainer/explanation"

module CanCanExplainer
  def self.explain
    @explanation = Explanation.new
    yield
    @explanation
  end

  def self.explanation
    @explanation
  end
end
