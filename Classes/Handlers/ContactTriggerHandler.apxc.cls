/*
After insert
If trigger.New.Emailaddress != Null, then send email confirmation
Else do nothing

After update
If trigger.New.Emailaddress != Null, then send email confirmation
Else do nothing
*/

public class ContactTriggerHandler {
    public static void sendEmailConfirmation(List<Contact> newContacts){
        for(contact newContact: newContacts){
            if(newContact.Email != null){
                EmailManager.sendEmail(newContact.Mail, 'Welcome to UberDog!', 'You have successfully set up your account with UberDog, were glad to have you!');
            }
            else{
                //do nothing
            }
            //loop through new contacts.
            //if email.address = valid(basic regex)
            //send email.
        }
    }
}