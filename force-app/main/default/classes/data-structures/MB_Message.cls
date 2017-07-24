public class MB_Message {

    public String originator { get; private set; } 
    public String body { get; private set; }
    public String recipients { get; private set; }

    public MB_Message(String originator, String body, String recipients) {
        if (originator == null || originator.trim().length() == 0)
            throw new MessageBirdService.MessageBirdException(Label.MB_OriginatorsMustBeSpecified);
        if (body == null || body.trim().length() == 0) {
            throw new MessageBirdService.MessageBirdException(Label.MB_BodyMustBeSpecified);
        }
        if (recipients == null || recipients.trim().length() == 0) {
            throw new MessageBirdService.MessageBirdException(Label.MB_RecipientsMustBeSpecified);
        }    

        this.originator = originator.trim();
        this.originator = this.originator.substring(0, Math.min(17, this.originator.length()));
        this.body = body.trim();
        this.recipients = recipients;
    }

    public MB_Message(String originator, String body, List<Long> recipients){
        this(originator, body, receipientsAsCommaSeperated(recipients));
    }

    private static String receipientsAsCommaSeperated(List<Long> recipients) {
        if (recipients == null) {
            return null;
        }
        if (recipients.size() == 0) {
            return '';
        }
        String recipientsAsString = '';
        for (Long l : recipients) {
            recipientsAsString = String.valueOf(l) + ',';
        }
        
        return recipientsAsString.substring(0, recipientsAsString.length() - 1);
    }

}
