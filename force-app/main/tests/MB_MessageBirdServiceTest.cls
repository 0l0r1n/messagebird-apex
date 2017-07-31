@isTest
private class MB_MessageBirdServiceTest {

    static testmethod void test_sendMessage_withMessageArgument(){
        Test.setMock(HttpCalloutMock.class, new MB_SendMessageResponseMock());
        MB_MessageResponse messageResponse = new MB_MessageBirdService().sendMessage(new MB_Message('Mario', 'Luigi', 'some obscure number'));
        System.assertEquals(MB_SendMessageResponseMock.SMS_BODY, messageResponse.body);
    }

    static testmethod void test_sendMessage_withBaseArguments(){
        Test.setMock(HttpCalloutMock.class, new MB_SendMessageResponseMock());
        MB_MessageResponse messageResponse = new MB_MessageBirdService().sendMessage('Mario', 'Luigi', new List<Long> { 00000000000L });
        System.assertEquals(MB_SendMessageResponseMock.SMS_BODY, messageResponse.body);
    }

    static testmethod void test_sendMessage_withBaseArgumentsAndReference(){
        Test.setMock(HttpCalloutMock.class, new MB_SendMessageResponseMock());
        MB_MessageResponse messageResponse = new MB_MessageBirdService().sendMessage('Mario', 'Luigi', new List<Long> { 00000000000L }, 'call me maybe');
        System.assertEquals(MB_SendMessageResponseMock.SMS_BODY, messageResponse.body);
    }

    static testmethod void test_sendFlashMessage_withBaseArguments(){
        Test.setMock(HttpCalloutMock.class, new MB_SendMessageResponseMock());
        MB_MessageResponse messageResponse = new MB_MessageBirdService().sendFlashMessage('Mario', 'Luigi', new List<Long> { 00000000000L });
        System.assertEquals(MB_SendMessageResponseMock.SMS_BODY, messageResponse.body);
    }

    static testmethod void test_sendFlashMessage_withReference(){
        Test.setMock(HttpCalloutMock.class, new MB_SendMessageResponseMock());
        MB_MessageResponse messageResponse = new MB_MessageBirdService().sendFlashMessage('Mario', 'Luigi', new List<Long> { 00000000000L }, 'smash bros');
        System.assertEquals(MB_SendMessageResponseMock.SMS_BODY, messageResponse.body);
    }

    static testmethod void test_deleteMessage(){
        MB_EmptyResponse response = new MB_EmptyResponse();
        Test.setMock(HttpCalloutMock.class, response);
        new MB_MessageBirdService().deleteMessage('123456');
        System.assertEquals(1, response.counter);
    }

    static testmethod void test_viewMessage(){
        Test.setMock(HttpCalloutMock.class, new MB_SendMessageResponseMock());
        MB_MessageResponse messageResponse = new MB_MessageBirdService().viewMessage('123456');
        System.assertEquals(MB_SendMessageResponseMock.SMS_BODY, messageResponse.body);
    }

    static testmethod void test_getListMessages(){
        Test.setMock(HttpCalloutMock.class, new MB_MessageListResponseMock());
        MB_MessageList listResponse = new MB_MessageBirdService().listMessages(0, 0);
    }

    static testmethod void test_getRequestHlr(){
        Test.setMock(HttpCalloutMock.class, new MB_HlrResponseMock());
        MB_Hlr hlr = new MB_MessageBirdService().getRequestHlr(4815163245L,'0');
    }

    static testmethod void test_getViewHlr(){
        Test.setMock(HttpCalloutMock.class, new MB_HlrResponseMock());
        MB_Hlr hlr = new MB_MessageBirdService().getViewHlr('0');
    }

    static testmethod void test_sendVoiceMessage_withBaseArguments(){
        Test.setMock(HttpCalloutMock.class, new MB_VoiceMessageResponseMock());
        new MB_MessageBirdService().sendVoiceMessage(new MB_VoiceMessage('4815163245', 'hi there!'));
    }

    static testmethod void test_sendVoiceMessage_withOtherArguments(){
        Test.setMock(HttpCalloutMock.class, new MB_VoiceMessageResponseMock());
        new MB_MessageBirdService().sendVoiceMessage('4815163245', 'hi there!');
    }

    static testmethod void test_sendVoiceMessage_withMoreArguments(){
        Test.setMock(HttpCalloutMock.class, new MB_VoiceMessageResponseMock());
        new MB_MessageBirdService().sendVoiceMessage('4815163245', 'hi there!', 'reference');
    }

    static testmethod void test_deleteVoiceMessage(){
        MB_EmptyResponse response = new MB_EmptyResponse();
        Test.setMock(HttpCalloutMock.class, response);
        new MB_MessageBirdService().deleteVoiceMessage('123456');
        System.assertEquals(1, response.counter);
    }

    static testmethod void test_viewVoiceMessage(){
        Test.setMock(HttpCalloutMock.class, new MB_VoiceMessageResponseMock());
        new MB_MessageBirdService().viewVoiceMessage('4815163245');
    }

    static testmethod void test_getListVoiceMessages(){
        Test.setMock(HttpCalloutMock.class, new MB_MessageListResponseMock());
        MB_MessageList listResponse = new MB_MessageBirdService().listVoiceMessages(0, 0);
    }

    static testmethod void test_getBalance(){
        Test.setMock(HttpCalloutMock.class, new MB_GetBalanceResponseMock());
        MB_Balance balance = new MB_MessageBirdService().getBalance();
        System.assertEquals('prepaid', balance.payment);
    }

}
