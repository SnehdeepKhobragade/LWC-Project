public class getCaseList2 {
@AuraEnabled
    public static List<case> getCaseList2(string contactId){
        List<case> caseList = new List<case>([select id,CaseNumber,Status,Origin,CurrencyIsoCode from Case Where ContactId =: contactId]);
        return caseList;
    }
}