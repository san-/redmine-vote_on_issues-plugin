require 'redmine'
require_dependency 'hooks' 
require_dependency 'query_column'

# patch issue_query to allow columns for weights
issue_query = (IssueQuery rescue Query)
issue_query.add_available_column(VOI_QueryColumn.new(:sum_weights, :sortable => '(SELECT sum(weight_val) FROM weight_on_issues WHERE issue_id=issues.id )'))
Issue.send(:include, WeightOnIssues::Patches::QueryPatch)


Redmine::Plugin.register :weight_on_issues do
  name 'Issues Weight'
  description 'This plugin allows to define a weight to issue. It\'s pourpose is to help on priority definition'
  version '1.0.0'
  url 'https://github.com/san-/redmine-weight_on_issues-plugin'
  author 'Sandro Valgoi'
  author_url 'https://jbsoft.com.br'
  
  requires_redmine  :version_or_higher => '3.3.4'
  
  project_module :weight_on_issues do
    permission :cast_weights, {:issue => :cast_weights }, :require => :loggedin
    permission :view_weights, {:issue => :view_weights}, :require => :loggedin
  end

 
end

class WeightOnIssuesListener < Redmine::Hook::ViewListener
  render_on :view_layouts_base_html_head, :inline =>  <<-END
      <%= stylesheet_link_tag 'view_issues_weight', :plugin => 'weight_on_issues' %>
      <%= javascript_include_tag 'view_issues_weight', :plugin => 'weight_on_issues' %>
    END
end
