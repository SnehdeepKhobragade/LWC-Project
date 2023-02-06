public class ContactListComp {
 @AuraEnabled
    public static string getContact(Contact newCon){
        system.debug('Contact:'+newCon.FirstName);
        insert newCon;
        return newCon.Id;
    }
}