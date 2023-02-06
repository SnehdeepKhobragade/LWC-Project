public class CaseListController {
   @AuraEnabled
    public static List<case> getCaseList(){
        List<case> caseList = new List<case>([select id,CaseNumber,Status,Origin,CurrencyIsoCode from Case]);
        return caseList;
    }
}