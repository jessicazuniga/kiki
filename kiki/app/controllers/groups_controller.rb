class GroupsController < ApplicationController

  def index
    @groups = Group.order(:name)
  end

end
