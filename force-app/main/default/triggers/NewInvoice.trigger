trigger NewInvoice on Invoice__c (after insert, after update) {
    if((Trigger.isInsert && Trigger.isAfter)||(Trigger.isUpdate && Trigger.isAfter)){
            InvoiceHandler.demoHandlerMethod(Trigger.new);
        }
    {
  
        if((Trigger.isInsert && Trigger.isAfter)||(Trigger.isUpdate && Trigger.isAfter)){
         InvoiceHandler.handlerMethod(Trigger.new);
        }
       
    }
       
    }