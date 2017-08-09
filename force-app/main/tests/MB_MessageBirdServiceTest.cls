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
        System.assertEquals(null, listResponse.items);
        System.assertEquals(null, listResponse.limit_x);
        System.assertEquals(null, listResponse.offset);
        System.assertEquals(null, listResponse.totalCount);
        System.assertEquals(null, listResponse.links);
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
        new MB_MessageBirdService().sendVoiceMessage(new MB_VoiceMessage('hi there!', '4815163245'));
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

    static testmethod void test_sendVerifyToken_withVerifyRequest() {
        Test.setMock(HttpCalloutMock.class, new MB_VerifyResponseMock());
        MB_VerifyRequest verifyRequest = new MB_VerifyRequest('1234567');
        MB_Verify verify = new MB_MessageBirdService().sendVerifyToken(verifyRequest);
    }

    static testmethod void test_sendVerifyToken_withRecipient() {
        Test.setMock(HttpCalloutMock.class, new MB_VerifyResponseMock());
        MB_Verify verify = new MB_MessageBirdService().sendVerifyToken('1234567');
    }

    static testmethod void test_verifyToken() {
        Test.setMock(HttpCalloutMock.class, new MB_VerifyResponseMock());
        MB_Verify verify = new MB_MessageBirdService().verifyToken('1234567', '123456');
    }

    static testmethod void test_getVerifyObject() {
        Test.setMock(HttpCalloutMock.class, new MB_VerifyResponseMock());
        MB_Verify verify = new MB_MessageBirdService().getVerifyObject('1234567');
    }

    static testmethod void test_viewLookup() {
        Test.setMock(HttpCalloutMock.class, new MB_LookupResponseMock());
        MB_Lookup lookup = new MB_Lookup(123231321L);
        lookup = new MB_MessageBirdService().viewLookup(lookup);
    }

    static testmethod void test_viewLookup_withPhoneNumber() {
        Test.setMock(HttpCalloutMock.class, new MB_LookupResponseMock());
        new MB_MessageBirdService().viewLookup(new MB_Lookup(123231321L));
    }

    static testmethod void test_requestLookupHlr() {
        Test.setMock(HttpCalloutMock.class, new MB_HlrResponseMock());
        MB_LookupHlr lookupHlr = new MB_LookupHlr();
        lookupHlr.msisdn = 321321312L;
        lookupHlr.reference = 'ref';
        new MB_MessageBirdService().requestLookupHlr(lookupHlr);
    }

    static testmethod void test_viewLookupHlr() {
        Test.setMock(HttpCalloutMock.class, new MB_HlrResponseMock());
        MB_LookupHlr lookupHlr = new MB_LookupHlr();
        lookupHlr.msisdn = 321321312L;
        lookupHlr.reference = 'ref';
        new MB_MessageBirdService().viewLookupHlr(lookupHlr);
    }

    static testmethod void test_viewLookupHlr_withPhoneNumber() {
        Test.setMock(HttpCalloutMock.class, new MB_HlrResponseMock());
        new MB_MessageBirdService().viewLookupHlr(32321312131L);
    }

    static testmethod void test_viewContact() {
        Test.setMock(HttpCalloutMock.class, new MB_ContactResponseMock());
        MB_Contact con = new MB_Contact(3231321L);
        con.id = 'test';
        new MB_MessageBirdService().viewContact(con);
    }

    static testmethod void test_viewContact_withId() {
        Test.setMock(HttpCalloutMock.class, new MB_ContactResponseMock());
        new MB_MessageBirdService().viewContact('some id');
    }

    static testmethod void test_createContact() {
        Test.setMock(HttpCalloutMock.class, new MB_ContactResponseMock());
        new MB_MessageBirdService().createContact(new MB_Contact(3231321L));
    }

    static testmethod void test_updateContact() {
        Test.setMock(HttpCalloutMock.class, new MB_ContactResponseMock());
        new MB_MessageBirdService().updateContact(new MB_Contact(3231321L));
    }

    static testmethod void test_deleteContact() {
        Test.setMock(HttpCalloutMock.class, new MB_EmptyResponse());
        new MB_MessageBirdService().deleteContact('some id');
    }

}
