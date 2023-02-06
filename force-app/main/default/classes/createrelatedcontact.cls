public class createrelatedcontact {
@AuraEnabled
    public static contact insertCon(Contact newcon)
    {
        insert newcon;
        return newcon;
    }
    @AuraEnabled
    public static Account getAccount(string acid)
    {
        Account acc = [select id,name from Account where Id =:acid];
        return acc;
    }
}