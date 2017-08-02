public class MB_LookupResponseMock implements HttpCalloutMock {
    
    public HttpResponse respond(HttpRequest req){
        HttpResponse response = new HttpResponse();
        response.setBody(JSON.serialize(new MB_Lookup()));
        return response; 
    }

}
