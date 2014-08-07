require 'rails_helper'

module DealRedemptions
  describe Admin::ImportController, type: :routing do
    routes { DealRedemptions::Engine::routes }

    describe 'routing' do
      it 'get #index' do
        expect(get: '/admin/transfer').to route_to('deal_redemptions/admin/import#new')
      end

      it 'post #create' do
        expect(post: 'admin/transfer').to route_to('deal_redemptions/admin/import#create')
      end

      it 'get #export_redemptions' do
        expect(get: '/admin/transfer/export_redemptions.csv').to route_to('deal_redemptions/admin/import#export_redemptions', format: 'csv')
      end
    end
  end
end