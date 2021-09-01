public class ContactTriggerHandler {
	public static void sendEmailConfirmation(List<Contact> newContacts){
        for(contact newContact: newContacts){
            //loop through new contacts.
            if(newContact.Email != null){
                //check email limit
                if (Limits.getEmailInvocations()<Limits.getLimitEmailInvocations()){
                EmailManager.sendMail(newContact.Email, 'Welcome to UberDog!', 'You have successfully set up your account with UberDog, were glad to have you!');
                }
                else if(newContact.Send_Email_Confirmation__c==True){
                    newContact.addError('Email Limit reached, uncheck Send Email Confirmation');
                }
                else{
                    //don't send email.
                }
            }
            else{
                //do nothing
            }
            //if email.address = valid(basic regex)
            //send email.
        }
       
    }
}
