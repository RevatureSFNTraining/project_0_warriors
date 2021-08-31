/*
After insert
If trigger.New.Emailaddress != Null, then send email confirmation
Else do nothing

After update
If trigger.New.Emailaddress != Null, then send email confirmation
Else do nothing
*/

public class ContactTriggerHandler {
    public void sendEmailConfirmation(List<Contact> newContats){
        for(contact newContact: newContacts){
            //loop through new contacts.
            //if email.address = valid(basic regex)
            //send email.
        }
    }
}