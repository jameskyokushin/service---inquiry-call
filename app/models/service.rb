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
  #WARRANTY_UNDER_WARRANTY = 'UNDER WARRANTY'
  #WARRANTY_OUT_OF_WARRANTY = 'OUT OF WARRANTY'
  

  belongs_to :branch
   class << self
      def status_collection
       {
        "PENDING" => STATUS_PENDING,
        "COMPLETE" => STATUS_COMPLETED
       }
      end
      #def warranty_collection
       #{
       #    "UNDER WARRANTY" => WARRANTY_UNDER_WARRANTY
       #    "OUT OF WARRANTY" => WARRANTY_OUT_OF_WARRANTY
       # }
      #end
   end
    def status_tag
        case self.status
          when STATUS_PENDING then :error
          when STATUS_COMPLETED then :ok
        end
    end
end

