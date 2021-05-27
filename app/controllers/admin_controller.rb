class AdminController < ApplicationController
  def index
    @shelters = Shelter.order_by_reverse_alpha
    @pending_shelters = Shelter.shelters_with_pending_applications
  end
end