module ApplicationHelper
  def breadcrumb_header
    content_tag(:div, class: "row wrapper border-bottom white-bg page-heading") do
      concat(content_tag(:div, class: "col-lg-10") do
        content_tag(:h2, controller_name.humanize) +
        content_tag(:ol, class: "breadcrumb") do
          content_tag(:li) do
            link_to "Home", dashboard_url
          end + 
          active_list_element
        end
      end + 
      content_tag(:div, nil, class: "col-lg-2")
      )
    end
  end

  def active_list_element
    return nil if url_for == dashboard_path
    content_tag(:li, class: "active") do
      content_tag(:strong) do
        link_to "#{params[:id].humanize + ' ' if params[:id] && controller_name == "settings"}#{controller_name.humanize}", url_for
      end
    end
  end
end
