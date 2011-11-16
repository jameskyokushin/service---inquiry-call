ActiveAdmin.register Service do

filter :branch_id
filter :company
filter :e_mail
#-----------------------------------------------------------------------------------
# for completed
  action_item :only => :show do
    link_to "COMPLETED", completed_service_admin_service_path(resource)
  end

 
  member_action :completed_service do
    @service = Service.find(params[:id])
    @service.status = Service::STATUS_COMPLETED
    @service.save
    
    redirect_to admin_service_path(@service), :notice => "SERVICE COMPLETED"
  end
#-------------------------------------------------------------------------------------
# for collection
  
  action_item :only => :show do
    link_to "FOR COLLECTION", collection_service_admin_service_path(resource)
  end

  member_action :collection_service do
    @service = Service.find(params[:id])
    @service.status = Service::STATUS_COLLECTION
    @service.save
    
    redirect_to admin_service_path(@service), :notice => "FOR COLLECTION"
  end

  
# SHow View
  show :title => :company do
    panel "Company Information" do
      attributes_table_for service do
      row("Company Name") { service.company }
      row("Address") { service.address }
      row("Contact Person") { service.contact_person }
      row("Contact Number") { service.contact_number }
      row("E-mail Address") { service.e_mail }
      row("STATUS") { service.status}
      
      end
    end
  
    panel "== Service ==" do
      attributes_table_for service do
        row("Problem / Solution") { service.complain }
 
      end
    end
  end
  scope :all, :default => true


  scope :PENDING do |services|
    services.where( :status => Service::STATUS_PENDING )
  end
  
  scope :COLLECTION do |service|
    service.where(:status => Service::STATUS_COLLECTION )
  end  

  scope :COMPLETED do |services|
    services.where(:status => Service::STATUS_COMPLETED )
  end
form do |f|
    f.inputs "Service Call" do
      f.input :branch
      f.input :company
      f.input :address
      f.input :contact_person
      f.input :contact_number, :label => "Any Contact Number"
      f.input :e_mail, :label => "Email Address"
      f.input :complain, :input_html => { :rows => 4 }
      f.input :status, :collection => Service.status_collection, :include_blank => false, :wrapper_html => { :style => "display:none;" }
    end 
   f.buttons
  end

index do
    column :status do |service|
      status_tag service.status, service.status_tag
    end
    column :company
    column :contact_person
    column :prepared_by
    column do |service|
      link_to("Details", admin_service_path(service)) + " | " + \
      #link_to("Edit", edit_admin_inquiry_path(inquiry)) + " | " + \
      link_to("Delete", admin_service_path(service), :method => :delete, :confirm => "Are you sure?")
    end
  end
end

