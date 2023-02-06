trigger ProjectCountTrigger on Building_Project__c (after insert, after Update, after Delete) {
    if(Trigger.isafter){
        if(Trigger.isinsert || Trigger.isupdate){
            CountProject.handlerMethod(trigger.new);
            
        }
        if(Trigger.isupdate || Trigger.isdelete){
            CountProject.handlerMethod(trigger.old);
        }
    }
}