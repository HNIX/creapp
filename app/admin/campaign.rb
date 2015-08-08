ActiveAdmin.register Campaign do
  permit_params :sent, :send_now, :send_on, :step_1_complete, :step_2_complete, :step_3_complete, :step_4_complete, :authorized

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
