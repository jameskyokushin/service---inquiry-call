
  
ActiveAdmin.register Service do
  sidebar :help, :only => :index do
    h5 "Email us at"
    h3 "james@kyokushin.com.ph"
  end



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
  show :title => :status do
    panel "Company Information" do
      attributes_table_for service do
      row("Date of Call") { service.created_at }
      row("Company Name") { service.company }
      row("Address") { service.address }
      row("Contact Person") { service.contact_person }
      row("Contact Number") { service.contact_number }
      row("E-mail Address") { service.e_mail }
      row("Warranty Notice") { service.warranty }
      row("Terms & Condition") { simple_format service.notes }
      
      end
    end
  
    panel "== Service ==" do
      attributes_table_for service do
        row("Problem / Solution") { simple_format service.complain }
 
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
      f.input :warranty, :collection => [["Out of Warranty","OUT OF WARRANTY"],["Under Warranty","UNDER WARRANTY"]], :as => :radio
      f.input :notes, :input_html => { :rows => 4 }, :label => "Terms & Condition" 
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
    column :created_at
    column do |service|
      link_to("Details", admin_service_path(service)) + " | " + \
      #link_to("Edit", edit_admin_inquiry_path(inquiry)) + " | " + \
      link_to("Delete", admin_service_path(service), :method => :delete, :confirm => "Are you sure?")
    end
  end
end

