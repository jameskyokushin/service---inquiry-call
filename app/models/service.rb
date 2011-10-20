class Service < ActiveRecord::Base

  STATUS_PENDING = 'PENDING'
  STATUS_COMPLETE  = 'COMPLETE'

  belongs_to :branch

   class << self
      def status_collection
       {
        "PENDING" => STATUS_PENDING,
        "COMPLETE" => STATUS_COMPLETE
       }
      end
   end
   def status_tag
        case self.status
          when STATUS_PENDING then :warning
          when STATUS_COMPLETE then :ok
        end
   end
end

