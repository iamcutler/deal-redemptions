module DealRedemptions
  module AdminHelper
    # Sidebar site name - Limit string length to under 26 or append ... at the end of string
    def site_name(name)
      site_name = name

      if name.length > 26
        site_name = "#{name[0..23]}..."
      end

      site_name
    end

    def admin_page_title(name)
      content_for(:admin_page_title) { name }
    end

    def admin_link_to(text, destination, options = {})
      match_text = options.delete(:match_text)

      classes = options[:class].present? ? options[:class].split(" ") : []
      classes << "active" if request.fullpath.downcase == destination.downcase || (match_text && request.fullpath.downcase.include?(match_text.downcase))

      options = options.except(:class)
      options.merge!(:class => classes.join(" ")) unless classes.empty?

      link_to(text, destination, options)
    end
  end
end