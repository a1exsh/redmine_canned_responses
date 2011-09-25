module CannedResponsesHelper
  def edit_canned_response_link(canned_response, title = l(:button_edit))
    link_to_if_authorized title, { :action => "edit", :id => canned_response },
      :class => "icon icon-edit"
  end

  def delete_canned_response_link(canned_response, title = l(:button_delete))
    link_to_if_authorized title,
      { :action => "destroy", :id => canned_response },
      :class => "icon icon-del",
      :method => :delete, :confirm => l(:text_are_you_sure)
  end

  def manage_canned_response_links(canned_response)
    [edit_canned_response_link(canned_response),
     delete_canned_response_link(canned_response)].join("\n")
  end

  def link_to_all_canned_responses
    link_to l(:label_canned_response_view_all),
      { :controller => "canned_responses", :action => "index",
        :project_id => @project },
      :class => "icon icon-multiple"
  end

  def link_to_new_canned_response
    link_to_if_authorized l(:label_new_canned_response),
      { :controller => "canned_responses", :action => "new",
        :project_id => @project },
      :class => "icon icon-add"
  end
end
