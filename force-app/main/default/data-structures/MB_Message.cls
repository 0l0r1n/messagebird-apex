public class MB_Message {

    String originator { get; } 
    String body { get; }
    String recipients { get; }

    public MB_Message(String originator, String body, String recipients) {
        if (originator == null || originator.trim().length() == 0)
            throw new MessageBirdService.MessageBirdException('Originator must be specified');
        if (body == null || body.trim().length() == 0) {
            throw new MessageBirdService.MessageBirdException('Body must be specified');
        }
        if (recipients == null || recipients.trim().length() == 0) {
            throw new MessageBirdService.MessageBirdException('Recipients must be specified');
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
