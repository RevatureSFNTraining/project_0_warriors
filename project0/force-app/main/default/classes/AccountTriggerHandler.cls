public with sharing class AccountTriggerHandler {
    public static void preventDuplicateAccounts(List<Account> acctList) {
        Set<String> newAcctName = new Set<String>();
        
        for (Account acct: acctList) {
        	newAcctName.add(acct.Name);
        }
        
        system.debug('New account name: ' + newAcctName);
        
        // get accounts with this name from db
        Map<Object, Object> existingNameCount = new Map<Object, Object>();
        AggregateResult[] acctNameCountResult = [
            SELECT name, count(id) FROM Account
            WHERE name =:newAcctName
            GROUP BY name
        ];
        
        system.debug('AccountTrigger.AcctNameCountResult ' + acctNameCountResult);
        
        for (AggregateResult ar: acctNameCountResult) {
            system.debug('Name: ' + ar.get('name'));
            system.debug('Name count: ' + ar.get('expr0'));
            existingNameCount.put(ar.get('name'), ar.get('expr0'));
        }
        
        for (Account acc: acctList) {
            if (existingNameCount.containsKey(acc.Name)) {
                acc.addError('Duplicate accounts are not allowed. The account ' + existingNameCount.get(acc.Name) + ' already exists with the name ' + acc.Name);
            }
        }
    }
}
