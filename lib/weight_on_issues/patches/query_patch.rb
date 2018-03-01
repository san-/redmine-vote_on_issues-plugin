
module WeightOnIssues
  module Patches
    module QueryPatch      
      def sum_weights(issue)
        if User.current.allowed_to?(:view_weights, nil, :global => true)
          WeightOnIssue.where('issue_id=?', issue.id).sum('weight_val')
        else
          '-'
        end
      end
    end
  end
end