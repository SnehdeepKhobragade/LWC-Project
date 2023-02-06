({
    doInit : function(component, event, helper) {
        var accid = component.get("v.recordId");
        component.set("v.contact.AccountId",component.get("v.recordId"));
        var action=component.get("c.getAccount");
        action.setParams({
            acid : component.get("v.recordId")
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                component.set("v.account",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
  InsertCont : function(component,event, helper){
        var action=component.get("c.insertCon");
        action.setParams({ "newcon": component.get("v.contact") });
             action.setCallback(this,function(data){
            component.set('v.accountId',data.getReturnValue())
        });
        $A.enqueueAction(action);
    }
})