public class MB_VerifyResponseMock implements HttpCalloutMock {

    public HttpResponse respond(HttpRequest req){
        HttpResponse response = new HttpResponse();
        response.setBody(JSON.serialize(new MB_Verify()));
        return response; 
    }
}
