require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception
  before_action :authenticate_user!

   def after_sign_in_path_for(resource)
      dashboard_home_index_path
  end


  #   def respond_modal_with(*args, &blk)
  #   options = args.extract_options!
  #   options[:responder] = ModalResponder
  #   respond_with *args, options, &blk
  # end

end