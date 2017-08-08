public class MB_HlrResponseMock implements HttpCalloutMock {
    
    public HttpResponse respond(HttpRequest req){
        HttpResponse response = new HttpResponse();
        response.setBody(JSON.serialize('{"id" : "id", "href": "", "msisdn": "", "network": ""}'));
        return response;
    }
    
}
