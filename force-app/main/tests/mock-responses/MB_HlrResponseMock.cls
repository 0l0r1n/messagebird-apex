public class MB_HlrResponseMock implements HttpCalloutMock {
    
    public HttpResponse respond(HttpRequest req){
        HttpResponse response = new HttpResponse();
        response.setBody(JSON.serialize(new MB_Hlr()));
        return response;
    }
    
}
