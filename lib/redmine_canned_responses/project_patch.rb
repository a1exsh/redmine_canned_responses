module RedmineCannedResponses
  module ProjectPatch
    def self.included(base)
      base.class_eval do
        has_many :canned_responses
      end
    end
  end
end
