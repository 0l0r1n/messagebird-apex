public class MB_MessageListResponseMock implements HttpCalloutMock {
    
    public HttpResponse respond(HttpRequest req){
        HttpResponse response = new HttpResponse();
        response.setBody(JSON.serialize(new MB_MessageList()));
        return response;
    }

}
