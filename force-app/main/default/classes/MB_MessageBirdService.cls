public class MB_MessageBirdService implements MB_IMessageBirdService {
    
    private static final String ENDPOINT = 'https://rest.messagebird.com';
    private static final String BALANCEPATH = '/balance';
    private static final String HLRPATH = '/hlr';
    private static final String MESSAGESPATH = '/messages';
    private static final String VOICEMESSAGESPATH = '/voicemessages';
    private static final String VERIFYPATH = '/verify';
    private static final String LOOKUPPATH = '/lookup';
    private static final String LOOKUPHLRPATH = '/lookup/{0}/hlr';

    public MB_MessageResponse sendMessage(MB_Message message) {
        return (MB_MessageResponse)JSON.deserialize(sendPayload(MESSAGESPATH, JSON.serialize(message)), MB_MessageResponse.class);
    }

    public MB_MessageResponse sendMessage(String originator, String body, List<Long> recipients) {
        return sendMessage(new MB_Message(originator, body, recipients));
    }

    public MB_MessageResponse sendMessage(String originator, String body, List<Long> recipients, String reference) {
        MB_Message message = new MB_Message(originator, body, recipients);
        message.reference = reference;
        return sendMessage(message);
    }

    public MB_MessageResponse sendFlashMessage(String originator, String body, List<Long> recipients) {
        MB_Message message = new MB_Message(originator, body, recipients);
        message.type = MB_MsgType.flash;
        return sendMessage(message);
    }

    public MB_MessageResponse sendFlashMessage(String originator, String body, List<Long> recipients, String reference) {
        MB_Message message = new MB_Message(originator, body, recipients);
        message.type = MB_MsgType.flash;
        message.reference = reference;
        return sendMessage(message);
    }

     public void deleteMessage(String id) {
        if (id == null) throw new IllegalArgumentException(Label.MB_MessageIdMustBeSpecified);
        deleteById(MESSAGESPATH, id);
    }

     public MB_MessageResponse viewMessage(String id) {
         if (id == null) throw new IllegalArgumentException(Label.MB_MessageIdMustBeSpecified);
         return (MB_MessageResponse) JSON.deserialize(requestById(MESSAGESPATH, id), MB_MessageResponse.class);
    }

    public MB_MessageList listMessages(Integer offset, Integer limit_x) {
        if (offset != null && offset < 0) throw new IllegalArgumentException(Label.MB_OffsetMustBeGtZero);
        if (limit_x != null && limit_x < 0) throw new IllegalArgumentException(Label.MB_LimitMustBeGtZero);
        Map<String, Object> queryParams = new Map<String, Object>();
        queryParams.put('limit', limit_x);
        queryParams.put('offset', offset);
        String response = doCallout(MESSAGESPATH + '?' + Util_Http.buildQueryParams(queryParams), null, 'GET');
        return (MB_MessageList) JSON.deserialize(response.replace('limit', 'limit_x'), MB_MessageList.class);
    }
    
    public MB_Balance getBalance(){
        return (MB_Balance)JSON.deserialize(requestById(BALANCEPATH, ''), MB_Balance.class);
    }

    public MB_Hlr getRequestHlr(Long msisdn, String reference) {
        if (msisdn == null)     throw new IllegalArgumentException(Label.MB_MsisdnMustBeSpecified);
        if (reference == null)  throw new IllegalArgumentException(Label.MB_ReferenceMustBeSpecified);
        
        Map<String, Object> payload = new Map<String, Object>();
        payload.put('msisdn', msisdn);
        payload.put('reference', reference);
        return (MB_Hlr)JSON.deserialize(sendPayload(HLRPATH, JSON.serialize(payload)), MB_Hlr.class);
    }

    public MB_Hlr getViewHlr(String hlrId) {
        if (hlrId == null) throw new IllegalArgumentException(Label.MB_HlrIdMustBeSpecified);
        return (MB_Hlr)JSON.deserialize(requestById(HLRPATH, hlrId), MB_Hlr.class);
    }

    public MB_VoiceMessageResponse sendVoiceMessage(MB_VoiceMessage voiceMessage){
        return (MB_VoiceMessageResponse)JSON.deserialize(sendPayload(VOICEMESSAGESPATH, JSON.serialize(voiceMessage)), MB_VoiceMessageResponse.class);
    }
   
    public MB_VoiceMessageResponse sendVoiceMessage(String body, String recipients){
        return sendVoiceMessage(new MB_VoiceMessage(body, recipients));
    }

    public MB_VoiceMessageResponse sendVoiceMessage(String body, String recipients, String reference){
        MB_VoiceMessage voiceMessage = new MB_VoiceMessage(body, recipients);
        voiceMessage.reference = reference;
        return sendVoiceMessage(voiceMessage);
    }

    public void deleteVoiceMessage(String id){
        if (id == null) throw new IllegalArgumentException(Label.MB_MessageIdMustBeSpecified);
        deleteById(VOICEMESSAGESPATH, id);
    }

    public MB_VoiceMessageResponse VoiceMessageResponse(String id){
        if (id == null) throw new IllegalArgumentException(Label.MB_MessageIdMustBeSpecified);
        return (MB_VoiceMessageResponse) JSON.deserialize(requestById(MESSAGESPATH, id), MB_MessageResponse.class);
    }



    // TODO: Chat

    // TODO: Lookup

    // TODO: Contacts

    // TODO: Groups

    private static String requestById(String path, String id){
        return doCallout(path + '/' + id, null, 'GET');
    }

    private static void deleteById(String path, String id){
        doCallout(path + '/' + id, null, 'DELETE');
    }

    private static String sendPayload(String path, String payload){
        return doCallout(path, payload, 'POST');
    }

    private static String doCallout(String path, String body, String method) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod(method);
        request.setEndpoint(ENDPOINT + path);
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Authorization','AccessKey ' + Util_Env.getValue('MB_AccessKey'));
        if (body != null) request.setBody(body);
        HttpResponse response = http.send(request);
        System.debug(response.getBody());
        return response.getBody();
    }
    
    public class MessageBirdException extends Exception {}
    public class IllegalArgumentException extends Exception {}
    public class ValidityException extends Exception {}
}
