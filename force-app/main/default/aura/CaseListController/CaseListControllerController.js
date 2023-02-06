({
	doInit : function(component, event, helper) {
        var action = component.get('c.getCaseList2');
        action.setParams({
            contactId : component.get('v.recordId'),
        });
        action.setCallback(this, function(response){
            var responseValue = response.getReturnValue();
            console.log('responseValue ', responseValue);
            component.set('v.caseList', responseValue);
        });
        $A.enqueueAction(action, false);
		
	},
    doRedirect : function(component, event, helper) {
        alert('Hi');
        var eve = event.getSource();//calling event.getSource() gets us a reference to the specific <lightning:button> that was clicked.
        var id = eve.get('v.name');
        var navEvt = $A.get("e.force:navigateToSObject"); //Navigates to an sObject record specified by recordId
        navEvt.setParams({
            "recordId": id,
            "slideDevName": "detail"
        });
        navEvt.fire();
    },
})