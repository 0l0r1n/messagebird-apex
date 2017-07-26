public class MB_GetBalanceResponseMock implements HttpCalloutMock {

    public HttpResponse respond(HttpRequest req){
        HttpResponse response = new HttpResponse();
        response.setBody('{"payment":"prepaid","type":"credits","amount":7}');
        return response; 
    }

}
