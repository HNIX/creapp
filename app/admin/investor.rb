ActiveAdmin.register Investor do
  permit_params :title, :linked_in, :fax, :price_from, :price_to, :verified, :principal, :subscribed, :phone, :phone_2

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
