public class MB_VoiceMessageResponseMock implements HttpCalloutMock {
    
    public HttpResponse respond(HttpRequest req){
        HttpResponse response = new HttpResponse();
        MB_VoiceMessage vm = new MB_VoiceMessage('4815163245', 'hi there!');
        response.setBody(JSON.serialize(vm));
        return response;
    }
}
