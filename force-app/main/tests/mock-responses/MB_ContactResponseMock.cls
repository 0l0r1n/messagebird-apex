public class MB_ContactResponseMock implements HttpCalloutMock {

    public HttpResponse respond(HttpRequest req){
        HttpResponse response = new HttpResponse();
        response.setBody(JSON.serialize(new MB_Contact(
            3132131231L, 'Leo', 'Alves', null
        )));
        return response;
    }

}
