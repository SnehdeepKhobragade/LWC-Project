public class InvoiceHandler {
public static void demoHandlerMethod(List<Invoice__c> invoiceList){
        set<Id> accSet = new set<Id>();
        for(Invoice__c invoiceObj:invoiceList){
            if(invoiceObj.Account_lookup__c!=null){
                accSet.add(invoiceObj.Account_lookup__c);
            }
        }
        Map<Id, Double> accMap=new Map<Id, Double>();
        List<AggregateResult> aggResult= [SELECT Account_lookup__c,Sum(Invoice_Amount__c) Amount FROM Invoice__c WHERE Account_lookup__c  IN : accSet AND Invoice_Date__c = THIS_YEAR Group by Account_lookup__c];
        for(AggregateResult aggRes:aggResult){
            Id accountId=(Id)aggRes.get('Account_lookup__cc');
            double sumAmount=(double)aggRes.get('Amount');
            accMap.put(accountId,sumAmount);
        }
        List<Account> accList=new List<Account>();
        for(Id key:accMap.KeySet()){
            Account acc= new Account();
            acc.id=key;
            acc.Latest_Year_Invoice_Amount__c=accMap.get(acc.id);
            accList.add(acc);
        }
        Update accList;
    }

      public static void handlerMethod(List<Invoice__c> invoiceList1){
        set<Id> accSet1 = new set<Id>();
        for(Invoice__c invoiceObj1: invoiceList1){
            if(invoiceObj1.Account_lookup__c!=null){
                accSet1.add(invoiceObj1.Account_lookup__c);
            }
        }
        Map<Id, Double> accMap=new Map<Id, Double>();
        List<AggregateResult> aggResult= [SELECT Account_lookup__c,Sum(Invoice_Amount__c) Amount FROM Invoice__c WHERE Account_lookup__c IN : accSet1 AND Invoice_Date__c =LAST_YEAR Group by Account_lookup__c];
        for(AggregateResult aggRes:aggResult){
            Id accountId=(Id)aggRes.get('Account_lookup__c');
            double sumAmount=(double)aggRes.get('Amount');
            accMap.put(accountId,sumAmount);
        } 
        
        List<Account> accList=new List<Account>();
        for(Id key:accMap.KeySet()){
            Account acc= new Account();
            acc.id=key;
            acc.Last_Year_Invoice_Amount__c=accMap.get(acc.id);
            accList.add(acc);
        }
        
        Update accList;
        
    }
}