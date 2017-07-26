@isTest
private class MB_MessageBirdServiceTest {

    static testmethod void test_sendMessage(){
        Test.setMock(HttpCalloutMock.class, new MB_SendMessageResponseMock());
        MB_MessageResponse messageResponse = new MB_MessageBirdService().sendMessage(new MB_Message('Mario', 'Luigi', 'some obscure number'));
        System.assertEquals(MB_SendMessageResponseMock.SMS_BODY, messageResponse.body);
    }

}
