class WeightOnIssue < ActiveRecord::Base
  unloadable
  
  # Every weight belongs to a user and an issue
  belongs_to :user
  belongs_to :issue
  
  def self.getMyWeight(issue)
    iRet = 0
    begin
     @weight = WeightOnIssue.find_by!("issue_id = ? AND user_id = ?", issue.id, User.current.id)
     iRet = @weight.weight_val
    rescue WeightOnIssue::RecordNotFound
     iRet = 0
    end
    iRet
  end
  
  def self.getWeightCountOnIssue(issue_id)
    where("issue_id = ?", issue_id).sum('weight_val')
  end
  
 
end
