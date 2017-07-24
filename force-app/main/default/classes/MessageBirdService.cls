public class MessageBirdService implements IMessageBirdService {
    
    private static final String ENDPOINT = 'https://rest.messagebird.com';
    private static final String BALANCEPATH = '/balance';
    private static final String HLRPATH = '/hlr';
    private static final String MESSAGESPATH = '/messages';
    private static final String VOICEMESSAGESPATH = '/voicemessages';
    private static final String VERIFYPATH = '/verify';
    private static final String LOOKUPPATH = '/lookup';
    private static final String LOOKUPHLRPATH = '/lookup/{0}/hlr';

    public MB_MessageResponse sendMessage(MB_Message message){
        try { 
           return (MB_MessageResponse)JSON.deserialize(doCallout(MESSAGESPATH, Json.serialize(message), 'POST'), MB_MessageResponse.class);
        } catch (Exception e){
            throw new MessageBirdException(e.getMessage());
            return null;
        }
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
