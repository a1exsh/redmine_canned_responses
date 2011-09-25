require 'redmine'
require 'dispatcher'

Dispatcher.to_prepare :redmine_canned_responses do
  require_dependency 'project'

  unless Project.included_modules.include? RedmineCannedResponses::ProjectPatch
    Project.send(:include, RedmineCannedResponses::ProjectPatch)
  end
end

Redmine::Plugin.register :redmine_canned_responses do
  name 'Redmine Canned Responses plugin'
  author 'Alex Shulgin <ash@commandprompt.com>'
  description 'Store and use prepared (canned) responses, per-project or globally.'
  version '0.0.1'
  url 'http://github.com/commandprompt/redmine_canned_responses'
#  author_url 'http://example.com/about'

  project_module :canned_responses do
    permission :manage_canned_responses,
    :canned_responses => [:index, :show, :preview, :new, :edit,
                          :create, :update, :destroy]
  end
end
