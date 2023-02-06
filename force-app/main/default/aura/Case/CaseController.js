({
	doInit : function(component, event, helper) {
        var action = component.get('c.getCaseList');
        action.setParams({
        });
        action.setCallback(this, function(response){
            var responseValue = response.getReturnValue();
            console.log('responseValue ', responseValue);
            component.set('v.caseList', responseValue);
        });
        $A.enqueueAction(action, false);
		
	}
})