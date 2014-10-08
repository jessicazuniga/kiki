class GroupsController < ApplicationController

  def index
  	redirect_to events_path if session.has_key?(:current_group_id)
    @groups = Group.order(:name)
  end

end
