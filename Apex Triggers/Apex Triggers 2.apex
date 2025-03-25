trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> newTask = new List<Task>();
    List<Opportunity> oppList = new List<Opportunity>();
    for(Opportunity opp : Trigger.new){
        if (opp.StageName == 'Closed Won'){
            oppList.add(opp);
        }
    }
    for(Opportunity opp2 : oppList){
        newTask.add(new Task(Subject = 'Follow Up Test Task',
                                WhatId = opp2.Id));
    }
    insert newTask;
}