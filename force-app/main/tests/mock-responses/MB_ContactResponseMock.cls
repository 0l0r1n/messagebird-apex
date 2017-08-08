public class MB_ContactResponseMock implements HttpCalloutMock {

    public HttpResponse respond(HttpRequest req){
        HttpResponse response = new HttpResponse();
        response.setBody(JSON.serialize(new MB_Contact(32132132131L)));
        return response;
    }

}
