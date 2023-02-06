({
 doInit : function(cmp){
 var action = cmp.get("c.getContents");
 var picId = cmp.get("v.pictureList");
 action.setParams({
 employeeId : picId.Id
 }) 
 action.setCallback(this, function(response) {
 var state = response.getState();
 if(cmp.isValid() && state === 'SUCCESS') {
 cmp.set("v.contents", response.getReturnValue()); 
 }
 });
 $A.enqueueAction(action);
 }, 
 handleVote : function(component, event, helper) {
 component.set("v.count", component.get("v.count")+1);
 var compEvent = component.getEvent("compEvent");
 compEvent.setParams({
 "message" : {id:event.getSource().get("v.value"), vote:component.get("v.count")}});
 compEvent.fire();
 },
 decreaseVote : function(component, event, helper) {
 component.set("v.count", component.get("v.count")-1);
 var compEvent = component.getEvent("compEvent");
 compEvent.setParams({
 "message" : {id:event.getSource().get("v.value"), vote:component.get("v.count")}});
 compEvent.fire();
 },
})