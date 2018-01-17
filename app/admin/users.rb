ActiveAdmin.register User do
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

	permit_params :email, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :postal_code, :address, :tel_num, :blacklist_flag
	menu label: "顧客情報", priority: 3

	index do
		column :email
		column :last_name
		column :first_name
		column :last_name_kana
		column :first_name_kana
		column :nickname
		column :postal_code
		column :address
		column :tel_num
		# column :blacklist_flag	
		column :blacklist_flag do |item|
			if item.blacklist_flag == "true"
				"●"
			else
				""
			end
		end
		actions
	end

	form do |f|
		f.inputs do
			f.input :email
			# f.input :password
			f.input :last_name
			f.input :first_name
			f.input :last_name_kana
			f.input :first_name_kana
			f.input :nickname
			f.input :postal_code
			f.input :address
			f.input :tel_num
			f.input :blacklist_flag	
		end
		f.actions
	end

	show do |i|
		attributes_table  do
			row :email
			row :last_name
			row :first_name
			row :last_name_kana
			row :first_name_kana
			row :postal_code
			row :address
			row :tel_num
			row :blacklist_flag		
		end
	end

end
