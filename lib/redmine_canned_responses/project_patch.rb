module RedmineCannedResponses
  module ProjectPatch
    def self.included(base)
      base.class_eval do
        has_many :canned_responses, :order => :title
      end
    end
  end
end
