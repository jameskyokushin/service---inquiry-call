class ServicesController < InheritedResources::Base
  before_filter :authenticate_user!

  def index
     @services = Service.order("").page(params[:page]).per(15)
  end
end


