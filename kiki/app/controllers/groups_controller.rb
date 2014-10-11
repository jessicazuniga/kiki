class GroupsController < ApplicationController

  def index
  	redirect_to events_path if cookies.has_key?(:current_group_id) && !cookies[:current_group_id].nil?
    @groups = Group.order(:name)
  end

end
