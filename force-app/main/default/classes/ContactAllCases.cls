public class ContactAllCases {
@AuraEnabled
    public static List<Case> getCases(){
        return[SELECT Id, status,Priority,caseNumber,Origin From Case ];
    }
}