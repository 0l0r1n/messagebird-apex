global class SendSmsAction {

    @InvocableVariable(required=true)
    global String originator;
    @InvocableVariable(required=true)
    global String recipients;
    @InvocableVariable(required=true)
    global String body;

    @InvocableMethod(label='Send Sms' description='Sends a SMS with specified content')
    global static void sendSms(){
        new MB_MessageBirdService().sendMessage(originator, body, recipients);
    }
    
}
