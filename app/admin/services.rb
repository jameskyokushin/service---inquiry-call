ActiveAdmin.register Service do

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
      #f.input :status, :collection => Service.status_collection, :as => :radio
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

