public class CreateContactData {
@Auraenabled
    public static string CreateContact(contact contobj){
        system.debug('contact::'+contobj.FirstName);
        insert contobj;
        return contobj.Id;
    }
}