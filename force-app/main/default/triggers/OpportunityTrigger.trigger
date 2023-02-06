trigger OpportunityTrigger on Opportunity (before Update) {
    
    if(Trigger.isBefore && Trigger.isUpdate){
        OpportunityHandler.OpportunityTest(Trigger.new,Trigger.old);
    }

}