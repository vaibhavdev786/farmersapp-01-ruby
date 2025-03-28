ActiveAdmin.register IdentifyDisease do
  menu parent: 'Crop Management', priority: 3

  permit_params :crop_id, :disease_name, :disease_cause, :solution, :products_recommended, :disease_image

  filter :crop
  filter :disease_name
  filter :created_at
  filter :updated_at

  form do |f|
    f.semantic_errors

    f.inputs do
      f.input :crop, include_blank: 'select crop'
      f.input :disease_name
      f.input :disease_cause, as: :text, input_html: { style: 'width: 78.5%; height: 100px;' }
      f.input :solution, as: :text, input_html: { style: 'width: 78.5%; height: 100px;' }
      f.input :products_recommended
      f.input :disease_image, as: :file, hint: 'Upload disease image'
    end

    f.actions
  end

  show do
    attributes_table do
      row :crop
      row :disease_name
      row :disease_cause
      row :solution
      row :products_recommended
      row :disease_image do |identify_disease|
        identify_disease.disease_image.attached? ? (image_tag url_for(identify_disease.disease_image), size: '200x200') : 'No image attached'
      end
      row :created_at
      row :updated_at
    end
  end

  index do
    selectable_column
		id_column
    column :crop
    column :disease_name
    column :disease_image do |identify_disease|
      identify_disease.disease_image.attached? ? (image_tag url_for(identify_disease.disease_image), size: '50x50') : 'No image attached'
    end

    actions
  end
end
