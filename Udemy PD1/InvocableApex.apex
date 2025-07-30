global class UpsertAction {

    @invocableMethod(label = 'Upsert Records' description = 'Upsert records to database' category = 'DML')
    global static List<List<SObject>> upsertRecords(List<List<SObject>> accountsToUpsert){
        List<List<SObject>> recordsToReturn = new List<List<SObject>>();
        for(Integer i = 0; i < recordsToReturn.size(); i++){
            List<SObject> recordsToUpsert = recordsToReturn[i];
            upsert recordsToUpsert;
            recordsToReturn[i] = recordsToUpsert;
        }
        return accountsToUpsert;
    }
}