@RestResource(urlMapping='/getContact/*')
global class CustDetailsApi {
@HttpGet
    global static Contact getCustomer()
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
         res.addHeader('Content-Type', 'application/json');
        string email;
        if(req.params.get('email') != null)
        {
        email =req.params.get('email');
        }
        Contact[] conObj =[Select ID,firstname,lastname,email from Contact where Contact.Email='vinod@gmail.com'];
        return conObj[1];
    }
}