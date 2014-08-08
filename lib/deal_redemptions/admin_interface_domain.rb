# Used to check if admin interface is set to false
# If so, disable all admin routes
module DealRedemptions
  class AdminInterfaceDomain
    def matches?(request)
      if DealRedemptions.config.admin_interface
        true
      end
    end
  end
end