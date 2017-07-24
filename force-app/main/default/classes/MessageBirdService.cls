public class MessageBirdService implements IMessageBirdService {
    
    private static final String BALANCEPATH = '/balance';
    private static final String HLRPATH = '/hlr';
    private static final String MESSAGESPATH = '/messages';
    private static final String VOICEMESSAGESPATH = '/voicemessages';
    private static final String VERIFYPATH = '/verify';
    private static final String LOOKUPPATH = '/lookup';
    private static final String LOOKUPHLRPATH = '/lookup/{0}/hlr';

    public MB_MessageResponse sendMessage(MB_Message message){
        return null;
    }
    
    public class MessageBirdException extends Exception {}
    public class ValidityException extends Exception {}
}
