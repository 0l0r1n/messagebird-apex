public class MB_EmptyResponse implements HttpCalloutMock {
    
    public Integer counter = 0;

    public HttpResponse respond(HttpRequest req){
        counter++;
        return new HttpResponse();
    }
    
}
