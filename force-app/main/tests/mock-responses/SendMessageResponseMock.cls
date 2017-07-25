public class SendMessageResponseMock implements HttpCalloutMock {

    public static final String SMS_BODY = 'I solemnly swear I am up to no good';

    public HttpResponse respond(HttpRequest req){
        String responseBody = '{"body" : "' + SMS_BODY + '"}';
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody(responseBody);
        return response; 
    }

}
