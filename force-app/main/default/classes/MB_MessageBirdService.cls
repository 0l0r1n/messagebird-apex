public class MB_MessageBirdService {
    
    private static final String BALANCEPATH = '/balance';
    private static final String HLRPATH = '/hlr';
    private static final String MESSAGESPATH = '/messages';
    private static final String VOICEMESSAGESPATH = '/voicemessages';
    private static final String VERIFYPATH = '/verify';
    private static final String LOOKUPPATH = '/lookup';
    private static final String LOOKUPHLRPATH = '/lookup/{0}/hlr';
    private static final String CONTACTPATH = '/contacts';
    private static final String CONTACTGROUPPATH = CONTACTPATH + '/{0}/groups';
    private static final String GROUPPATH = '/groups';
    private static final String GROUPCONTACTPATH = GROUPPATH + '/{0}/contacts';

    public MB_MessageResponse sendMessage(MB_Message message) {
        return (MB_MessageResponse) MB_MessageBirdWebService.sendPayload(MESSAGESPATH, message, MB_MessageResponse.class);
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
        MB_MessageBirdWebService.deleteById(MESSAGESPATH, id);
    }

     public MB_MessageResponse viewMessage(String id) {
         if (id == null) throw new IllegalArgumentException(Label.MB_MessageIdMustBeSpecified);
         return (MB_MessageResponse) MB_MessageBirdWebService.requestById(MESSAGESPATH, id, MB_MessageResponse.class);
    }

    public MB_MessageList listMessages(Integer offset, Integer limit_x) {
        if (offset != null && offset < 0) throw new IllegalArgumentException(Label.MB_OffsetMustBeGtZero);
        if (limit_x != null && limit_x < 0) throw new IllegalArgumentException(Label.MB_LimitMustBeGtZero);
        return (MB_MessageList) MB_MessageBirdWebService.requestList(MESSAGESPATH, offset, limit_x, MB_MessageList.class);
    }
    
    public MB_Balance getBalance() {
        return (MB_Balance) MB_MessageBirdWebService.requestById(BALANCEPATH, '', MB_Balance.class);
    }

    public MB_Hlr getRequestHlr(Long msisdn, String reference) {
        if (msisdn == null)     throw new IllegalArgumentException(Label.MB_MsisdnMustBeSpecified);
        if (reference == null)  throw new IllegalArgumentException(Label.MB_ReferenceMustBeSpecified);
        
        Map<String, Object> payload = new Map<String, Object>();
        payload.put('msisdn', msisdn);
        payload.put('reference', reference);
        return (MB_Hlr) MB_MessageBirdWebService.sendPayload(HLRPATH, payload, MB_Hlr.class);
    }

    public MB_Hlr getViewHlr(String hlrId) {
        if (hlrId == null) throw new IllegalArgumentException(Label.MB_HlrIdMustBeSpecified);
        return (MB_Hlr) MB_MessageBirdWebService.requestById(HLRPATH, hlrId, MB_Hlr.class);
    }

    public MB_VoiceMessageResponse sendVoiceMessage(MB_VoiceMessage voiceMessage) {
        return (MB_VoiceMessageResponse) MB_MessageBirdWebService.sendPayload(VOICEMESSAGESPATH, voiceMessage, MB_VoiceMessageResponse.class);
    }
   
    public MB_VoiceMessageResponse sendVoiceMessage(String body, String recipients) {
        return sendVoiceMessage(new MB_VoiceMessage(body, recipients));
    }

    public MB_VoiceMessageResponse sendVoiceMessage(String body, String recipients, String reference) {
        MB_VoiceMessage voiceMessage = new MB_VoiceMessage(body, recipients);
        voiceMessage.reference = reference;
        return sendVoiceMessage(voiceMessage);
    }

    public void deleteVoiceMessage(String id) {
        if (id == null) throw new IllegalArgumentException(Label.MB_MessageIdMustBeSpecified);
        MB_MessageBirdWebService.deleteById(VOICEMESSAGESPATH, id);
    }

    public MB_VoiceMessageResponse viewVoiceMessage(String id) {
        if (id == null) throw new IllegalArgumentException(Label.MB_MessageIdMustBeSpecified);
        return (MB_VoiceMessageResponse) MB_MessageBirdWebService.requestById(MESSAGESPATH, id, MB_VoiceMessageResponse.class);
    }

    public MB_MessageList listVoiceMessages(Integer offset, Integer limit_x) {
        if (offset != null && offset < 0) throw new IllegalArgumentException(Label.MB_OffsetMustBeGtZero);
        if (limit_x != null && limit_x < 0) throw new IllegalArgumentException(Label.MB_LimitMustBeGtZero);
        return (MB_MessageList) MB_MessageBirdWebService.requestList(VOICEMESSAGESPATH, offset, limit_x, MB_MessageList.class);
    }

    public MB_Verify sendVerifyToken(MB_VerifyRequest verifyRequest) {
        if (verifyRequest == null)
            throw new IllegalArgumentException(Label.MB_VerifyRequestCannotBeNull);
        if (verifyRequest.recipient == null || verifyRequest.recipient.length() == 0)
            throw new IllegalArgumentException(Label.MB_RecipientMustBeProvidedForVerify);
        return (MB_Verify) MB_MessageBirdWebService.sendPayload(VERIFYPATH, verifyRequest, MB_Verify.class);
    }

    public MB_Verify sendVerifyToken(String recipient) {
        if (recipient == null || recipient.length() == 0) throw new IllegalArgumentException(Label.MB_RecipientMustBeProvidedForVerify);
        MB_VerifyRequest verifyRequest = new MB_VerifyRequest(recipient);
        return sendVerifyToken(verifyRequest);
    }

    public MB_Verify verifyToken(String id, String token) {
        if (id == null || id.length() == 0)
            throw new IllegalArgumentException(Label.MB_IdCannotBeEmptyForVerify);
        else if (token == null || token.length() == 0)
            throw new IllegalArgumentException(Label.MB_TokenCannotBeEmptyForVerify);
        Map<String, Object> params = new Map<String, Object>{ 'token' => token };
        return (MB_Verify) MB_MessageBirdWebService.requestById(VERIFYPATH, id, params, MB_Verify.class);
    }

    public MB_Verify getVerifyObject(String id) {
        if (id == null || id.length() == 0)
            throw new IllegalArgumentException(Label.MB_IdMustBeProvidedForVerify);
        return (MB_Verify) MB_MessageBirdWebService.requestById(VERIFYPATH, id, MB_Verify.class);
    }

    public MB_Lookup viewLookup(MB_Lookup lookup) {
        if (lookup.phoneNumber == null) 
            throw new IllegalArgumentException(Label.MB_PhoneNumberMustBeSpecified);
    
        Map<String, Object> params = new Map<String, Object>();
        if (lookup.countryCode != null) 
            params.put('countryCode', lookup.countryCode);
        
        return (MB_Lookup) MB_MessageBirdWebService.requestById(LOOKUPPATH, String.valueOf(lookup.phoneNumber), params, MB_Lookup.class);
    }

    public MB_Lookup viewLookup(Long phoneNumber) {
        if (phoneNumber == null) 
            throw new IllegalArgumentException(Label.MB_PhoneNumberMustBeSpecified);
        
        return viewLookup(new MB_Lookup(phoneNumber));
    }

    public MB_LookupHlr requestLookupHlr(MB_LookupHlr lookupHlr) {
         if (lookupHlr.msisdn == null) 
            throw new IllegalArgumentException(Label.MB_PhoneNumberMustBeSpecified);
        if (lookupHlr.reference == null) {
            throw new IllegalArgumentException(Label.MB_ReferenceMustBeSpecified);
        }
        Map<String, Object> payload = new Map<String, Object>();
        payload.put('phoneNumber', lookupHlr.msisdn);
        payload.put('reference', lookupHlr.reference);
        if (lookupHlr.countryCode != null) {
            payload.put('countryCode', lookupHlr.countryCode);
        }
        return (MB_LookupHlr) MB_MessageBirdWebService.sendPayLoad(String.format(LOOKUPHLRPATH, new List<String> { String.valueOf(lookupHlr.msisdn) }), payload, MB_LookupHlr.class);
    }

    public MB_LookupHlr viewLookupHlr(MB_LookupHlr lookupHlr) {
        if (lookupHlr.msisdn == null) {
            throw new IllegalArgumentException(Label.MB_PhoneNumberMustBeSpecified);
        }
        Map<String, Object> params = new Map<String, Object>();
        if (lookupHlr.countryCode != null) 
            params.put('countryCode', lookupHlr.countryCode);
        
        return (MB_LookupHlr) MB_MessageBirdWebService.requestById(String.format(LOOKUPHLRPATH, new List<String> { String.valueOf(lookupHlr.msisdn) }), '', params, MB_LookupHlr.class);
    }

    public MB_LookupHlr viewLookupHlr(Long phoneNumber) {
        if (phonenumber == null)
            throw new IllegalArgumentException(Label.MB_PhoneNumberMustBeSpecified);
        
        MB_LookupHlr lookupHlr = new MB_LookupHlr();
        lookupHlr.msisdn = phonenumber;
        return viewLookupHlr(lookupHlr);
    }

    public MB_Contact viewContact(String id) {
        if (id == null)
            throw new IllegalArgumentException(Label.MB_IdMustBeProvidedforContact);
        return (MB_Contact) MB_MessageBirdWebService.requestById(CONTACTPATH, id, MB_Contact.class);
    }

    public MB_Contact viewContact(MB_Contact contact) {
        if (contact.id == null)
            throw new IllegalArgumentException(Label.MB_IdMustBeProvidedforContact);
        return (MB_Contact) MB_MessageBirdWebService.requestById(CONTACTPATH, contact.id, MB_Contact.class);
    }

    public MB_Contact viewContacts() {
        return (MB_Contact) MB_MessageBirdWebService.requestById(CONTACTPATH, '', MB_Contact.class);
    }

    public MB_Contact createContact(Long phoneNumber) { 
        return (MB_Contact) MB_MessageBirdWebService.sendPayLoad(CONTACTPATH, JSON.serialize(new MB_Contact(phoneNumber)), MB_Contact.class);
    }

    public MB_Contact createContact() { 
        return null;
    }


    public MB_Contact updateContact() {
        return null;
    }

    public void deleteContact() {
        //if (id == null) throw new IllegalArgumentException(Label.MB_MessageIdMustBeSpecified);
        MB_MessageBirdWebService.deleteById(CONTACTPATH, id);
    }

    public class MessageBirdException extends Exception {}
    public class IllegalArgumentException extends Exception {}
    public class ValidityException extends Exception {}
}
