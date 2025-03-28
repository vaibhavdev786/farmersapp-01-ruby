ActiveAdmin.register Category do
  menu parent: 'Product Management', priority: 1

  permit_params :name

  filter :name
  filter :created_at
  filter :updated_at

  form do |f|
    f.semantic_errors

    f.inputs do
      f.input :name
    end

    f.actions
  end

  show do
    attributes_table do
      row :name
      row :created_at
      row :updated_at
    end
  end

  index do
    selectable_column
    id_column
    column :name

    actions
  end
end
