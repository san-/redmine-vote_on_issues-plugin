class WeightOnIssuesController < ApplicationController
  # respond_to :html, :js
  unloadable

  #Authorize against global permissions defined in init.rb
  # ?? does prevent everythin below admin?
  # TODO - find out how this works
  #before_filter :authorize_global
  #before_filter :authorize
  
  def index
    @project = Project.find(params[:project_id])
    @weights = WeightOnIssue.all
  end

  def cast_weight
    @iMyWeight = params[:weight_val]
    if 'nil' == params[:weight_val]
      @iMyWeight = 0;
    end
    
    begin
      @w = WeightOnIssue.find_by!("issue_id = ? AND user_id = ?", params[:issue_id], User.current.id)
      @w.weight_val = @iMyWeight
      @w.save
    rescue ActiveRecord::RecordNotFound
      if 0 != @iMyWeight
        @w = WeightOnIssue.new
        @w.user_id  = User.current.id
        @w.issue_id = params[:issue_id]
        @w.weight_val = @iMyWeight
        @w.save
      end
    end
    
    @weight = WeightOnIssue.getWeightSumOnIssue(params[:issue_id])
    @issue = Issue.find(params[:issue_id])
    
    # Auto loads /app/views/weight_on_issues/cast_weight.js.erb
  end
  
end
