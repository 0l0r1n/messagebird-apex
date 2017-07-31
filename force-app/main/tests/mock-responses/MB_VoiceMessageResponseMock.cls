public class MB_VoiceMessageResponseMock implements HttpCalloutMock {
    
    public HttpResponse respond(HttpRequest req){
        HttpResponse response = new HttpResponse();
        response.setBody(JSON.serialize(new MB_VoiceMessageResponse()));
        return response;
    }
}
