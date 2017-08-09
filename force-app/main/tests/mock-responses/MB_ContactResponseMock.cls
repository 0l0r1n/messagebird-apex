public class MB_ContactResponseMock implements HttpCalloutMock {

    public HttpResponse respond(HttpRequest req){
        HttpResponse response = new HttpResponse();
        MB_Contact contact = new MB_Contact(3132131231L, 'Leo', 'Alves', null);
        contact.href = 'http://some_url';
        contact.createdDatetime = String.valueOf(System.now().getTime());
        contact.updatedDatetime = String.valueOf(System.now().getTime());
        MB_Contact.CustomDetails customDetails = new MB_Contact.CustomDetails();
        customDetails.custom1 = '';
        customDetails.custom2 = '';
        customDetails.custom3 = '';
        customDetails.custom4 = '';
        contact.customDetails = customDetails;
        response.setBody(JSON.serialize(contact));
        return response;
    }

}
