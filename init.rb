require 'redmine'
require 'dispatcher'

require_dependency 'redmine_canned_responses/view_hooks'

Dispatcher.to_prepare :redmine_canned_responses do
  require_dependency 'project'
  require_dependency 'projects_helper'
  require_dependency 'projects_controller'

  unless Project.included_modules.include? RedmineCannedResponses::ProjectPatch
    Project.send(:include, RedmineCannedResponses::ProjectPatch)
  end

  unless ProjectsHelper.included_modules.include? RedmineCannedResponses::ProjectsHelperPatch
    ProjectsHelper.send(:include, RedmineCannedResponses::ProjectsHelperPatch)
  end

  unless ProjectsController.included_modules.include? RedmineCannedResponses::ProjectsControllerPatch
    ProjectsController.send(:include, RedmineCannedResponses::ProjectsControllerPatch)
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

  menu :admin_menu, :canned_responses,
    { :controller => 'canned_responses', :action => 'index' },
    :caption => :label_canned_response_plural,
    :html => { :class => 'canned_responses' }
end
