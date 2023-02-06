({
    doCreateContact : function(component, event, helper) {
        var action = component.get("c.getContact");
        action.setParams({'newCon':component.get('v.newContact')
         });
         action.setCallback(this,function(response){
         component.set('v.contactId',data.getReturnValue())
         var state = response.data(); //Returns the current state of an action
             if(state === "SUCCESS") {
                component.set("v.message", "Contact created successfully");
            }
            else if (state === "ERROR") {
                console.log('Problem saving contact, response state: ' + state);
            }
         });
        // Send the request to create the new contact
        $A.enqueueAction(action);
    },
})