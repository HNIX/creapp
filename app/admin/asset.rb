ActiveAdmin.register Asset do
  permit_params :name, :description, :size, :land_size, :price, :price_psf, :hide_price, :cap_rate, :occupancy, :highlights, :year_built

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
