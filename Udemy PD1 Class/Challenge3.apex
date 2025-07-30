/* Case Generator Trigger
Calls trigger handler for platform event
*/

trigger Case_Generator_Trigger on Case_Generator__e (after insert) {
    Case_Generator_Trigger_Handler.generateCases(Trigger.new);

}


/*Case Generator Trigger Handler
Logic for case generator
*/

global class Case_Generator_Trigger_Handler{
    
    //Generates Cases from Platform Event Case_Generator__e
    public static void generateCases(Case_Generator__e[] newGenerators){
        Case_Generator_setting_mdt typeSetting = [SELECT Default_Value__c
                                                  FROM Case_Generator_Setting__mdt
                                                  WHERE Label = :'Type'
                                                  LIMIT 1];
        Case[] casesToInsert = new Case[]{};
            for(Case_Generator__e generator : newGenerators){
                casesToInsert.add(new Case(Subject = generator.Subject__c,
                                           Description = generator.Description__c,
                                           Type = typeSetting.Default_Value__c));
            }
        insert casesToInsert;
    }
}