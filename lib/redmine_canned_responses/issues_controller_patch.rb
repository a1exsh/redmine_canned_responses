module RedmineCannedResponses
  module IssuesControllerPatch
    def self.included(base)
      base.class_eval do
        helper :canned_responses
      end
    end
  end
end
