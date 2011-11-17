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
  STATUS_COLLECTION = 'FOR COLLECTION'

  belongs_to :branch
   class << self
      def status_collection
       {
        "PENDING" => STATUS_PENDING,
        "FOR COLLECTION" => STATUS_COLLECTION,
        "COMPLETE" => STATUS_COMPLETED,
       }
      end
   end
    def status_tag
        case self.status
          when STATUS_PENDING then :error
          when STATUS_COLLECTION then :warning
          when STATUS_COMPLETED then :ok
        end
    end
end

