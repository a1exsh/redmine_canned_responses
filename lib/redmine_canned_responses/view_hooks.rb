module RedmineCannedResponses
  class ViewHooks < Redmine::Hook::ViewListener
    render_on :view_layouts_base_html_head,
      :partial => 'hooks/view_layouts_base_html_head'

    render_on :view_issues_edit_notes_bottom,
      :partial => 'hooks/view_issues_edit_notes_bottom'
  end
end
