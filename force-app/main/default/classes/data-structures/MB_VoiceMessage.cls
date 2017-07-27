public class MB_VoiceMessage {

    public String body { get; private set; }
    public String recipients { get; private set; }
    public String originator { get; set; } 
    public String reference { get; set; }
    public String language { get; set; }
    public MB_VoiceType voice { get; set; }
    public MB_IfMachineType ifMachine { get; set; }
    public String scheduleDateTime { get; set; }
    public Integer repeat { get; set {
            if (value < 1)
                throw new MB_MessageBirdService.IllegalArgumentException(Label.MB_RepeatCannotBeLtZero);
        }
    }

    public MB_VoiceMessage(String body, List<Long> recipients) { 
        this(body, MB_MessageUtilities.recipientsAsCommaSeparated(recipients));
    }

    public MB_VoiceMessage(String body, String recipients) {
        if (recipients == null || recipients.trim().length() == 0)
            throw new MB_MessageBirdService.IllegalArgumentException(Label.MB_RecipientsMustBeSpecified);
        if (body == null || body.trim().length() == 0)
            throw new MB_MessageBirdService.IllegalArgumentException(Label.MB_BodyMustBeSpecified);
        
        this.recipients = recipients.trim();
        this.body = body.trim();
    }
    

}
