module ApplicationHelper
  def breadcrumb_header
    content_tag(:div, class: "row wrapper border-bottom white-bg page-heading") do
      concat(content_tag(:div, class: "col-lg-10") do
        content_tag(:h2, controller_name.humanize) +
        content_tag(:ol, class: "breadcrumb") do
          content_tag(:li) do
            link_to "Home", dashboard_url
          end + 
          controller_list_element + 
          active_list_element
        end
      end + 
      content_tag(:div, nil, class: "col-lg-2")
      )
    end
  end

  def active_list_element
    return nil if url_for == dashboard_path
    text = case controller_name
      when "properties"
        case action_name
          when "show" then @property.pretty_name
          when "new" then "New Property"
          else
          end
      else
      end

    text ||= controller_name.humanize
    content_tag(:li, class: "active") do
      content_tag(:strong, text)
    end
  end

  def controller_list_element
    return nil if url_for == dashboard_path
    path = case controller_name
      when "properties" 
        return nil if dashboard_properties_path == url_for
        dashboard_properties_path
      else
      end

    content_tag(:li) do
      link_to controller_name.humanize, path
    end
  end
end
