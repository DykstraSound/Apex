public static void startFlow(String flowName){
    Map<String,Object> params = new Map<String,Object>{'varName'=>1};
    Flow.Interview myFlow = Flow.Interview.createInterview(flowName, params);
    myFlow.start();
}