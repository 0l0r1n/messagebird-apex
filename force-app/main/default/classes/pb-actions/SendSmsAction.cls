global class SendSmsAction {    

    @InvocableMethod(label='Send Sms' description='Sends a SMS with specified content')
    global static void sendSms(List<SmsRequest> smsRequests){
        dispatch(smsRequests);
    }

    private static void dispatch(List<SmsRequest> smsRequests) {
        MB_MessageBirdService messageBird = new MB_MessageBirdService();
        for (SmsRequest request : smsRequests)
            messageBird.sendMessage(new MB_Message(request.originator, request.body, request.recipients));
    }

    global class SmsRequest {
        @InvocableVariable(required=true)
        global String originator;
        @InvocableVariable(required=true)
        global String recipients;
        @InvocableVariable(required=true)
        global String body;
    }

}
