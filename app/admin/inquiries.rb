ActiveAdmin.register Inquiry do
  
    index do
      column "Date Created", :created_at
      column :company
      column :contact_person
      column "Email", :e_mail
      column :id
      default_actions
    end

end
