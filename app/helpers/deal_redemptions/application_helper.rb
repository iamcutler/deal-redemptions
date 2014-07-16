module DealRedemptions
  module ApplicationHelper
    # Set page layout title
    def page_title(page_title)
      content_for(:title) { page_title }
    end
  end
end
