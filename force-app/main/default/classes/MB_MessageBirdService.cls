public class MB_MessageBirdService implements MB_IMessageBirdService {
    
    private static final String ENDPOINT = 'https://rest.messagebird.com';
    private static final String BALANCEPATH = '/balance';
    private static final String HLRPATH = '/hlr';
    private static final String MESSAGESPATH = '/messages';
    private static final String VOICEMESSAGESPATH = '/voicemessages';
    private static final String VERIFYPATH = '/verify';
    private static final String LOOKUPPATH = '/lookup';
    private static final String LOOKUPHLRPATH = '/lookup/{0}/hlr';

    public MB_MessageResponse sendMessage(MB_Message message){
        return (MB_MessageResponse) JSON.deserialize(doCallout(MESSAGESPATH, JSON.serialize(message), 'POST'), MB_MessageResponse.class);
    }

    public MB_MessageResponse sendMessage(String originator, String body, List<Long> recipients){
        MB_Message message = new MB_Message(originator, body, recipients);
        return (MB_MessageResponse) JSON.deserialize(doCallout(MESSAGESPATH, JSON.serialize(message), 'POST'), MB_MessageResponse.class);
    }

    public MB_MessageResponse sendMessage(String originator, String body, List<Long> recipients, String reference){
        MB_Message message = new MB_Message(originator, body, recipients);
        message.reference = reference;
        return (MB_MessageResponse) JSON.deserialize(doCallout(MESSAGESPATH, JSON.serialize(message), 'POST'), MB_MessageResponse.class);
    }

    public MB_MessageResponse sendFlashMessage(String originator, String body, List<Long> recipients) {
        MB_Message message = new MB_Message(originator, body, recipients);
        message.type = MB_MsgType.flash;
        return (MB_MessageResponse) JSON.deserialize(doCallout(MESSAGESPATH, JSON.serialize(message), 'POST'), MB_MessageResponse.class);
    }

    public static String doCallout(String path, String body, String method){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod(method);
        request.setEndpoint(ENDPOINT + path);
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Authorization','AccessKey ' + 'OlT1W3xGaE6qPha3oQBDKgCsN');
        request.setBody(body);
        HttpResponse response = http.send(request);
        return response.getBody();
    }
    
    public class MessageBirdException extends Exception {}
    public class ValidityException extends Exception {}
}
