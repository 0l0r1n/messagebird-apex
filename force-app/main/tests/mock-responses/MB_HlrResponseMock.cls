public class MB_HlrResponseMock implements HttpCalloutMock {
    
    public HttpResponse respond(HttpRequest req){
        return new HttpResponse();
    }
}
