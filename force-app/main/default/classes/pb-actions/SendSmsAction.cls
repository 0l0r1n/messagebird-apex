global class SendSmsAction {

    global class SmsPb {
        @InvocableVariable(required=true)
        global String originator;
        @InvocableVariable(required=true)
        global String recipients;
        @InvocableVariable(required=true)
        global String body;
    }
    

    @InvocableMethod(label='Send Sms' description='Sends a SMS with specified content')
    global static void sendSms(SmsPb smsRequest){
        new MB_MessageBirdService().sendMessage(smsRequest.originator, smsRequest.body, smsRequest.recipients);
    }
    
}
