ActiveAdmin.register Patient do
  permit_params :email, :type, :name
end
