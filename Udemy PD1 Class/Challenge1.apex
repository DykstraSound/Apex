// Trigger - Opp insert or updated
trigger updateOppTax on Opportunity (before update, before insert){
    if (Trigger.isInsert){
        // Check if Amount and Tax_Percentage__c are not null
        for (Opportunity opp : Trigger.new) {
            if (opp.Amount != null && opp.Tax_Percentage__c != null) {
                Decimal taxedAmount = updateOppTaxHandler.taxedAmount(opp.Amount, opp.Tax_Percentage__c);
                opp.Amount = taxedAmount;
            }
        }
    }
    else if (Trigger.isUpdate){
        // Check if Amount and Tax_Percentage__c have been updated AND are not null
        for (Opportunity opp : Trigger.new) {
            if ((Trigger.oldMap.get(opp.Id).Amount != opp.Amount || 
                 Trigger.oldMap.get(opp.Id).Tax_Percentage__c != opp.Tax_Percentage__c) &&
                (opp.Amount != null && opp.Tax_Percentage__c != null)) {
                Decimal taxedAmount = updateOppTaxHandler.taxedAmount(opp.Amount, opp.Tax_Percentage__c);
                opp.Amount = taxedAmount;
            }
        }
    }
}

// Trigger handler - Calculate tax percentage and total amount.
public class updateOppTaxHandler {
    
    public static Decimal taxedAmount (Decimal oppAmount, Decimal taxPercentage){
        Decimal taxAmount = (taxPercentage / 100);
        Decimal totalAmount = (taxAmount * oppAmount) + oppAmount;
        return totalAmount;
    }
}
// Tax__c = Tax__Percentage__c * Amount  Must convert to decimal.
// Total_Price__c = Tax__c + Amount
// Do not run if Amount or Tax__Percentage__c are not updated.
// Do not run if Amount or Tax__Percentage__c are null or 0.0


// CORRECT SOLUTION

/*
* Name: OpportunityTrigger
* Description: Runs before every Opportunity DML action
*/

trigger OpportunityTrigger on Opportunity (before insert, before update, before delete) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            OpportunityTriggerHandler.beforeInsert(Trigger.new);
        }
        if(Trigger.isUpdate){
            OpportunityTriggerHandler.beforeUpdate(Trigger.newMap, Trigger.oldMap);
        }
        if(Trigger.isDelete){
            //Develop before delete method
        }
    }
}


global class OpportunityTriggerHandler {

    //Method to calculate Tax on opportunity
    private static void calculateTax(Opportunity opp){
        opp.Tax__c = (opp.Tax_Percentage__c / 100) * opp.Amount;
        opp.Total_Price__c = opp.Tax__c + opp.Amount;
    }
    
    //Runs on Opportunity before insert
    global static void beforeInsert(List<Opportunity> newRecords){
        //Loop through new records
        for(Opportunity opp : newRecords){
            if(opp.Tax_Percentage__c != null){
                calculateTax(opp);
            }
        }
    }

    //Runs on Opportunity before update
    global static void beforeUpdate(Map<Id, Opportunity> newMap, Map<Id, Opportunity> oldMap){
        //Loop through new records
        for(Id oppId : newMap.keySet()){
            Opportunity newRecord = newMap.get(oppId);
            Opportunity oldRecord = oldMap.get(oppId);
            if(newRecord.Amount != oldRecord.Amount || newRecord.Tax_Percentage__c != oldRecord.Tax_Percentage__c){
                calculateTax(newRecord);
            }
        }
    }

}
