ActiveAdmin.register Like do
  permit_params :image_name, :like_count

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  index do
    id_column
    column :image_name
    column :like_count
    column "Image" do |image|
      image_tag image.img_url, class: 'my_image_size'
    end
    actions
  end
end
