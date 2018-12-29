global with sharing class VueController {
    @RemoteAction
    global static Account[] getAccounts() {
        return [SELECT Id, Name, Phone, Type, NumberOfEmployees FROM Account Limit 10];
    }
}