module CanCanExplainer
  class Explanation
    def initialize
      @conditions_matched = []
    end

    def add_condition_match(source_location, action, subject, extra_args)
      @conditions_matched.push(
        {
          source_location: source_location,
          action: action,
          subject: subject,
          extra_args: extra_args
        }
      )
    end

    def to_s
      @conditions_matched.map { |e|
        format(
          "%s %s %s %s",
          e[:action],
          e[:subject],
          e[:extra_args],
          e[:source_location]
        )
      }.join("\n")
    end
  end
end
