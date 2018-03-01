# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'weight_on_issues/cast_weight', :to => 'weight_on_issues#cast_weight'
get 'weight_on_issues', :to => 'weight_on_issues#index'
