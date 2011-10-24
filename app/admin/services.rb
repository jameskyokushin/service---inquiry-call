ActiveAdmin.register Service do

 action_item :only => :show do
    link_to "COMPLETED", send_service_admin_service_path(resource)
  end
  
  member_action :send_service do
    @service = Service.find(params[:id])
    @service.status = Service::STATUS_COMPLETE
    @service.save
    
    redirect_to admin_service_path(@service), :notice => "SERVICE COMPLETED"
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
   # panel "Items" do
   #   table_for shipping.items do |t|
   #   t.column("Qty.") { |item| number_with_delimiter item.quantity }
   #    t.column("Model.") { |item| item.model  }
   #    t.column("Description.") { |item| item.description  }
       #t.column("Unit Price.") { |item| number_to_currency item.amount }
   #   end
   # end
    panel "== Service ==" do
      attributes_table_for service do
        row("Problem / Solution") { service.complain }
   #     row("Recieved By") { shipping.recieve_by }
   #     row("By") { shipping.status }
   #     row("Forwarder") { shipping.forwarder }
   #     row("Estimated Time/Date Departure") {  shipping.pinadala }
   #     row("Estimated Time/Date Arrival") {  shipping.darating }
      end
    end
  end
  scope :all, :default => true

  scope :PENDING do |services|
    services.where(:status => Service::STATUS_PENDING)
  end

  scope :COMPLETE do |services|
    services.where(:status => Service::STATUS_COMPLETE)
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
      f.input :status, :collection => Service.status_collection, :as => :radio
    end
   f.buttons
  end

index do
    column :status do |service|
      status_tag service.status, service.status_tag
    end
    column :company do |service|
        link_to service.company, admin_service_path(service)
      end
    column :contact_person
  end
end

