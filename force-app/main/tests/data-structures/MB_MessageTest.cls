@IsTest
private class MB_MessageTest {
    
    static testmethod void test_createBinarySMS(){
        MB_Message binaryMsg = MB_Message.createBinarySMS('originator', 'header', 'body', '123321321312L');
        System.assertEquals(MB_MsgType.binary, binaryMsg.type);
    }

    static testmethod void test_createBinarySMS_alternativeArguments(){
        MB_Message binaryMsg = MB_Message.createBinarySMS('originator', 'header', 'body', new List<Long>{ 123321321312L });
        System.assertEquals(MB_MsgType.binary, binaryMsg.type);
    }

    // purely for coverage reasons
    static testmethod void test_setValidity() {
        MB_Message binaryMsg = MB_Message.createBinarySMS('originator', 'header', 'body', new List<Long>{ 123321321312L });
        binaryMsg.validity = 1;
    }

    static testmethod void test_setPremiumSms() {
        MB_Message message = new MB_Message('Link', 'Ganondorf', '321321231');
        message.setPremiumSMS('shortcode', 'keyword', 'tariff', 'mid');
        System.assertEquals(MB_MsgType.premium, message.type);
    }
}
