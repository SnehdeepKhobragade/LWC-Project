({
    doInit : function(component, event, helper) {
        var action = component.get('c.getVamriTechEmployee');
        action.setParams({
        });
        action.setCallback(this, function(response){
            var responseValue = response.getReturnValue();
            console.log('responseValue ', responseValue);
            component.set('v.employeeList', responseValue);
        });
        $A.enqueueAction(action, false);
    },
    handleComponentEvent : function(component, event, helper) {
        var allEmployees =  component.get('v.employeeIdWIthVote');
        var valueFromChild = event.getParam("message");
        var isDataExists = false;
        allEmployees.forEach((eachemp)=>{
            if(eachemp.id === valueFromChild.id) {
            	eachemp.Vote__c = valueFromChild.vote;
            	isDataExists = true;
        }
        })
        if(isDataExists === false) {
            allEmployees.push({id:valueFromChild.id, Vote__c: valueFromChild.vote});
        }
        console.log('valueFromChild ',valueFromChild);
        console.log('allEmployees ',allEmployees);
        component.set('v.employeeIdWIthVote', allEmployees);
    },
    Submit : function(component, event, helper) {
        if(component.get('v.employeeIdWIthVote').length > 0) {
            var action = component.get("c.saveAllEmployee");
            action.setParams({
                allEmployees : JSON.stringify(component.get('v.employeeIdWIthVote'))
            });
            action.setCallback(this, function(response){
                var state = response.getState();
                if (state === "SUCCESS") {
                  alert('Votes has been submitted.');
               }
            });
            $A.enqueueAction(action);
        }else {
            alert('Please update the vote before submit.')
        }
    },
   openModel: function(component, event, helper) {
      // Set isModalOpen attribute to true
      component.set("v.isModalOpen", true);
       var updatedData = [];
       var existingEmployee = component.get('v.employeeList');
      var allEmployees =  component.get('v.employeeIdWIthVote');
       existingEmployee.forEach((eachExistingEmp) => {
           var result = allEmployees.filter(eachemp => eachExistingEmp.Id === eachemp.id);
           if(result.length > 0) {
           		eachExistingEmp.Vote__c = result[0].Vote__c;
       		}else {
                   eachExistingEmp.Vote__c = 0;
               }
           updatedData.push(eachExistingEmp);
       })
       component.set("v.employeeList", updatedData);
   },
   submitDetails: function(component, event, helper) {
      // Set isModalOpen attribute to false
      //Add your code to call apex method or do some processing
      component.set("v.isModalOpen", false);
   }
})