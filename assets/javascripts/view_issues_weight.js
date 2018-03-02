/**
**
**
** @package 
** @author     Ole Jungclaussen
** @version    1.0.0
** @.copyright 2017, Ole Jungclaussen
**/
var weight_on_issues = {
    version : '1.0.0'
    
    // ALL WEIGHT
    , showWeightsOnIssue: function(iWeight){
        $('#weight_on_issues_weight').html(iWeight);
    }
    // MY VOTE
    , showMyWeight : function(iUserWeight){
        $('#weight_on_issues_MyWeight').val(iUserWeight);
    }
};
