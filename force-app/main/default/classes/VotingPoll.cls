public class VotingPoll {
 @AuraEnabled
public static List<VamriTechEmployee__c> getVamriTechEmployee(string employeeId){
 List<VamriTechEmployee__c> voteList = new List<VamriTechEmployee__c>([select 
id,Name,Last_Name__c,Vote__c from VamriTechEmployee__c ]);
 return voteList;
 }
 @AuraEnabled
 public static void saveAllEmployee(string allEmployees){
 System.debug('allEmployees '+allEmployees);
 //Sine all Employee is strigified for its array of object, hence needs deserialize into object form
 List<VamriTechEmployee__c> employeeDetails = 
(List<VamriTechEmployee__c>)JSON.deserialize(allEmployees, List<VamriTechEmployee__c>.class);
 update employeeDetails;
 Voting_Result__c v = new Voting_Result__c();
 for(VamriTechEmployee__c vm : [select id,Name,Last_Name__c,Vote__c from 
VamriTechEmployee__c WHERE Id =:employeeDetails]){
 system.debug('Vm>>>>>'+vm); 
 if(vm.Name == 'Swati'){
 v.Swati_Voting_Count__c = vm.Vote__c;
 }
 else if(vm.Name == 'Rohan'){
 v.Rohan_Voting_Count__c = vm.Vote__c;
 }
 else if(vm.Name == 'Shweta'){
 v.Shweta_Voting_Count__c = vm.Vote__c;
 }
 else if(vm.Name == 'Anil'){
 v.Anil_Voting_Count__c = vm.Vote__c;
 }
 else if(vm.Name == 'Asifa'){
 v.Asifa_Voting_Count__c = vm.Vote__c;
 }
 else if(vm.Name == 'Bhavani'){
 v.Bhavani_Voting_Count__c = vm.Vote__c;
 }
 else if(vm.Name == 'Durga'){
 v.Durga_Voting_Count__c = vm.Vote__c;
 }
 else if(vm.Name == 'Haritha'){
 v.Haritha_Voting_Count__c = vm.Vote__c;
 }
 else if(vm.Name == 'Lavanya'){
 v.Lavanya_Voting_Count__c = vm.Vote__c;
 }
 else if(vm.Name == 'Naresh'){
 v.Naresh_Voting_Count__c = vm.Vote__c;
 }
 else if(vm.Name == 'Nikhilesh'){
 v.Nikhilesh_Voting_Count__c = vm.Vote__c;
 }
 else if(vm.Name == 'Pavani'){
 v.Pavani_Voting_Count__c = vm.Vote__c;
 }
 else if(vm.Name == 'Praneeth'){
 v.Praneeth_Voting_Count__c = vm.Vote__c;
 }
 else if(vm.Name == 'Rajitha'){
 v.Rajitha_Voting_Count__c = vm.Vote__c;
 }
 else if(vm.Name == 'Ranjith'){
 v.Ranjith_Voting_Count__c = vm.Vote__c;
 }
 else if(vm.Name == 'Shikha'){
 v.Shikha_Voting_Count__c = vm.Vote__c;
 }
 else if(vm.Name == 'Snehdeep'){
 v.Snehdeep_Voting_Count__c = vm.Vote__c;
 }
 else if(vm.Name == 'Sravani'){
 v.Sravani_Voting_Count__c = vm.Vote__c;
 }
 else if(vm.Name == 'Sukanya'){
 v.Sukanya_Voting_Count__c = vm.Vote__c;
 }
 else if(vm.Name == 'Swami'){
 v.Swami_Voting_Count__c = vm.Vote__c;
 }
 else if(vm.Name == 'Tarun'){
 v.Tarun_Voting_Count__c = vm.Vote__c;
 }
 else if(vm.Name == 'Amrutha'){
 v.Amrutha_Voting_Count__c = vm.Vote__c;
 }
 } 
 insert v;
 }
 @AuraEnabled
 public static List<ContentVersion> getContents(string employeeId) {
 Set<Id> contentIds = new Set<Id>();
 //SOQL query to get pictures from VamriTechEmployee object
 for (ContentDocumentLink cont :[SELECT ContentDocumentId, LinkedEntityId FROM 
ContentDocumentLink where
 LinkedEntityId in ( SELECT Id FROM VamriTechEmployee__c where Id =: 
employeeId)]) {
 contentIds.add(cont.ContentDocumentId);
 }
 //Below Query will return the latest image Id uploaded in files 
 return [SELECT Id,Title FROM ContentVersion WHERE ContentDocumentId IN :contentIds LIMIT 1];
 }
}