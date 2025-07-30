/*
Create Defined Type for ConvertLeadActionResult
*/

global class ConvertLeadActionResultType{

    global ConvertLeadActionResultType(){}

    global ConvertLeadActionResultType(Account newAccount, Contact newContact, Opportunity newOpp){
        this.accountId = newAccount.Id;
        this.accountName = newAccount.Name;
        this.contactId = newContact.Id;
        this.contactFirstName = newContact.FirstName;
        this.contactLastName = newContact.LastName;
        this.opportunityId = newOpp.Id;
        this.opportunityName = newOpp.Name;
    }

    @InvocableVariable
    @AuraEnabled
    global String accountId;

    @InvocableVariable
    @AuraEnabled
    global String accountName;

    @InvocableVariable
    @AuraEnabled
    global String contactId;

    @InvocableVariable
    @AuraEnabled
    global String contactFirstName;

    @InvocableVariable
    @AuraEnabled
    global String contactLastName;

    @InvocableVariable
    @AuraEnabled
    global String opportunityId;

    @InvocableVariable
    @AuraEnabled
    global String opportunityName;
}

/*----------------------------------------------------------------------------------------*/

/*
Create Defined Type for ConvertLeadActionRequest
*/

global class ConvertLeadActionRequestType {

    global ConvertLeadActionRequestType(){}


    @InvocableVariable(required=true)
    @AuraEnabled
    global ID leadId;

    @InvocableVariable(required=true)
    @AuraEnabled
    global String convertedStatus;

    @InvocableVariable
    @AuraEnabled
    global ID accountId;

    @InvocableVariable
    @AuraEnabled
    global ID contactId;

    @InvocableVariable
    @AuraEnabled
    global Boolean overWriteLeadSource;

    @InvocableVariable
    @AuraEnabled
    global Boolean createOpportunity;

    @InvocableVariable
    @AuraEnabled
    global String opportunityName;

    @InvocableVariable
    @AuraEnabled
    global ID ownerId;

    @InvocableVariable
    @AuraEnabled
    global Boolean sendEmailToOwner;
  }