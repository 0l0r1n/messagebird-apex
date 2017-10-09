@isTest
private class SendSmsActionTest {
    
    static testmethod void sendSms_test(){
        SendSmsAction.SmsRequest request = new SendSmsAction.SmsRequest();
        request.body = 'Give me back King\'s landing, Usurpers!';
        request.originator = 'Daenerys Targaryen';
        request.recipients = 'Lannisters';
        SendSmsAction.sendSms(new List<SendSmsAction.SmsRequest> { request });
    }

}
