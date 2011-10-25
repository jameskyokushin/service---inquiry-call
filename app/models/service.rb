class Service < ActiveRecord::Base

  validates :company,
            :address,
            :contact_person,
            :contact_number,
            :complain,
            :e_mail,
            :branch_id, :presence => true
  #validates :status, :inclusion => { :in => [STATUS_PENDING], :message => "You need to pick one status." }


  STATUS_PENDING = 'PENDING'
  STATUS_COMPLETED  = 'COMPLETED'

  belongs_to :branch

   class << self
      def status_collection
       {
        "PENDING" => STATUS_PENDING,
        "COMPLETE" => STATUS_COMPLETED
       }
      end
   end
   def status_tag
        case self.status
          when STATUS_PENDING then :error
          when STATUS_COMPLETED then :ok
        end
   end
end

