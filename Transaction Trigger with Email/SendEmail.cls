public class SendEmail {
/*
    public static void sendEmailTo(String address, String subject, String body) {
        Messaging.reserveSingleEmailCapacity(1);
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        mail.setSenderDisplayName('Mei Banking');
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        System.debug(results[0].isSuccess());
        System.debug(results[0].getErrors());
    }
*/
    public static void sendEmailTo(Transaction__c t) {
        // Get the email of the bank account owner.
        Bank_Account__c acc = [SELECT Account_Owner__c FROM Bank_Account__c WHERE Id IN (SELECT Bank_Account__c FROM Transaction__c WHERE Id = :t.Id)];
        Id str = acc.Account_Owner__c;
        Contact c = [SELECT Email FROM Contact WHERE id = :str];
        String emailAddress = c.Email;
        
        // Send email code.
        Messaging.reserveSingleEmailCapacity(0);
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {emailAddress};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Transaction');
        mail.setPlainTextBody('A transaction was just added to your account!');
        mail.setSenderDisplayName('Mei Banking');
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        System.debug(results[0].isSuccess());
        System.debug(results[0].getErrors()[0].getMessage());
     
    }
    
}