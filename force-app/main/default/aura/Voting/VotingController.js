({
	increment : function(component, event, helper) {
       var count = parseInt (component.get("v.count")+1);
          component.set("v.count",count);
    },
    decrement : function(component, event, helper) {
        var count=parseInt (component.get("v.count")-1);
        component.set("v.count",count);
        },
    increment : function(component, event, helper) {
       var count = parseInt (component.get("v.count")+1);
          component.set("v.count",count);
    },
    decrement : function(component, event, helper) {
        var count=parseInt (component.get("v.count")-1);
        component.set("v.count",count);
        },
})