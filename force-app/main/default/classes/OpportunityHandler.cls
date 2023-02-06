public class OpportunityHandler {
   
      public Static void OpportunityTest(List<Opportunity> newOpportunityList,List<Opportunity> oldOpportunityList)
      {
        
        for (Opportunity OldOpp:oldOpportunityList)
        
    {
        for (Opportunity NewOpp:newOpportunityList)
        {
            if(OldOpp.id ==NewOpp.id && OldOpp.Amount != NewOpp.Amount)
                NewOpp.addError('Opportunnity Amount cannot be changed');
        }      
            
    }
      }
}