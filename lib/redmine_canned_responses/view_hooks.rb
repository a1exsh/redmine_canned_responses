module RedmineCannedResponses
  class ViewHooks < Redmine::Hook::ViewListener
    render_on :view_layouts_base_html_head,
      :partial => 'hooks/view_layouts_base_html_head'
  end
end
