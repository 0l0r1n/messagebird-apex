public class MB_LookupResponseMock implements HttpCalloutMock {
    
    public HttpResponse respond(HttpRequest req){
        HttpResponse response = new HttpResponse();
        MB_Lookup lk = new MB_Lookup();
        MB_Lookup.Formats formats = new MB_Lookup.Formats();
        formats.e164 = '';
        formats.international = '';
        formats.national = '';
        formats.rfc3966 = '';
        lk.formats = formats;
        response.setBody(JSON.serialize(lk));
        return response; 
    }

}
