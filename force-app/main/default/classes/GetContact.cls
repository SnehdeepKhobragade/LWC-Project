@RestResource(urlMapping='/getContactDemo/*')
global class GetContact {
   @HttpGet
    global static List<Case> getConsumer()
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        res.addHeader('Content-Type', 'application/json');
        string email;
        if(req.params.get('email')!= null)
        {
        email =req.params.get('email');
        }
        case[]result=[select Id,Contact.Name,Contact.Email,CaseNumber,Origin From Case Where  Contact.Email='vinod@gmail.com' ];
        return result;

    }

}