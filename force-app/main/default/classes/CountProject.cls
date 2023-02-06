public class CountProject {
    public static void handlerMethod(list<Building_Project__c> prlist){
        set<Id>setid =new set<Id>();
        list<Account> acclist = new list<Account>();
        for(Building_Project__c pro:prlist){
            setid.add(pro.Account__c);
            
        }
        list<Account> accqr=[select id, name, number_of_building_projects__c,(select Id, Name from Building_Projects__r)from Account where Id=:setId];
        for(Account acc:accqr){
            acc.number_of_building_projects__c = acc.Building_Projects__r.size();
            acclist.add(acc);
        }
        update acclist;
    }

}