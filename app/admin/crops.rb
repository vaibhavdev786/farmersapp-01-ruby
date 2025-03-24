ActiveAdmin.register Crop do
  menu parent: 'Crop Management', priority: 1

  permit_params :name, :crop_image

  filter :name
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :crop_image, as: :file, hint: 'Upload crop image'
    end
    f.actions
  end
  
  show do
    attributes_table do
      row :name
      row :crop_image do |crop|
        crop.crop_image.attached? ? (image_tag url_for(crop.crop_image), size: '200x200') : 'No image attached'
      end
      row :created_at
      row :updated_at
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :crop_image do |crop|
      crop.crop_image.attached? ? (image_tag url_for(crop.crop_image), size: '50x50') : 'No image attached'
    end
    actions
  end
end
