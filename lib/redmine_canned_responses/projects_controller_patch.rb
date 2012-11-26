module RedmineCannedResponses
  module ProjectsControllerPatch
    unloadable

    def self.included(base)
      base.class_eval do
        helper :canned_responses
      end
    end
  end
end
