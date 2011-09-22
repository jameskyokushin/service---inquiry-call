ActiveAdmin.register Service do
  
  index do
    column "Asi Branch", :branch
    column :company
    column :contact_person
    column "Email", :e_mail
    column :id
  end
  
 
end
