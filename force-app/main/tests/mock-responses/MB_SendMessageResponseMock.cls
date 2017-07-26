public class SendMessageResponseMock implements HttpCalloutMock {

    public static final String SMS_BODY = 'I solemnly swear I am up to no good';

    public HttpResponse respond(HttpRequest req){
        HttpResponse response = new HttpResponse();
        response.setBody('{"body" : "' + SMS_BODY + '"}');
        return response; 
    }

}
