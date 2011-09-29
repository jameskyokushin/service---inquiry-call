ActiveAdmin.register Service do
  
  index do
    table_for Service.order("created_at desc")
      column "Company", :company do |service|
        link_to service.company, [:admin, service]
      end
    column :contact_person
    column "Asi Branch", :branch
  end
  
 
end
