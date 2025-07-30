//Invocable Method that calls queueable class
global class CallQueueableClassAction{

    @InvocableMethod(label = 'Queue Autolaunched Flow' desctiption = 'Queues Async Flow Interview' category = 'Invocable')
    global static queueFlow(List<String> flowName, List<String> inputs){
        System.enqueueJob(new QueueNextFlow(flowName, inputs);
    }
}












//Queueable Class that calls autolaunched flow
global class QueueNextFlow implements Queueable{

    global QueueNextFlow(String flowName, List<String> inputs){

    }

    global void execute(QueueableContext context){

    }
}












//Defined Types?