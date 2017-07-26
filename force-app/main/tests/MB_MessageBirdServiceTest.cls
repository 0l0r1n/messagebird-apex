@isTest
private class MessageBirdServiceTest {

    static testmethod void test_sendMessage(){
        Test.setMock(HttpCalloutMock.class, new SendMessageResponseMock());
        MB_MessageResponse messageResponse = new MessageBirdService().sendMessage(new MB_Message('Mario', 'Luigi', 'some obscure number'));
        System.assertEquals(SendMessageResponseMock.SMS_BODY, messageResponse.body);
    }

}
