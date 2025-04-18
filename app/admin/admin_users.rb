ActiveAdmin.register AdminUser do
  menu priority: 2, label: 'Admin Users'

  permit_params :email, :password, :password_confirmation

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :updated_at

  config.sort_order = 'created_at_desc'

  form do |f|
    if f.object.errors[:base].any?
      div style: 'background-color: #ffe6e6; border: 1px solid #ff4d4d; padding: 10px; margin-bottom: 20px; color: #d8000c; font-weight: bold;' do
        ul style: 'padding-left: 20px; margin: 0;' do
          f.object.errors[:base].each do |msg|
            li "• #{msg}"
          end
        end
      end
    end

    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end

    f.actions
  end

  show do
    attributes_table do
      row :email
      row :current_sign_in_at
      row :sign_in_count
      row :created_at
      row :updated_at
    end
  end

  index do
    selectable_column

    column('No.', sortable: :created_at) do |admin_user|
      AdminUser.order(:created_at).pluck(:id).index(admin_user.id) + 1
    end

    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at

    actions
  end
end
