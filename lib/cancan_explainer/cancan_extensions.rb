require "cancan/rule"

module CanCanExplainer
  module RuleExtensions
    def initialize(*args)
      @source_location = determine_source_location_from(caller)
      super
    end

    # The source location of the rule is found in the stack trace entry
    # immediately prior to `Ability#can` (or `cannot`).
    def determine_source_location_from(caller)
      index = caller.index { |line|
        line =~ %r{lib/cancan/ability\.rb:\d+:in `(can|cannot)'}
      }
      index.nil? ? nil : caller[index + 1]
    end

    def matches_conditions?(action, subject, extra_args)
      result = super
      CanCanExplainer.
        explanation&.
        add_condition_match(@source_location, action, subject, extra_args)
      result
    end
  end
end

CanCan::Rule.prepend(CanCanExplainer::RuleExtensions)
