public class MB_Message {

    public String originator { get; private set; } 
    public String body { get; private set; }
    public String recipients { get; private set; }
    public String reference { get; set; }
    public Integer gateway { get; set; }
    public Map<String, Object> typeDetails { get; set; }
    public Integer mclass { get; set; }
    public Date scheduledDatetime { get; set; }
    public MB_DataCodingType datacoding = MB_DataCodingType.plain;
    public MB_MsgType type { 
        get; set {
            type = value;
            if (type == MB_MsgType.flash)
                this.mclass = MB_MClassType.flash.ordinal();
            else
                this.mclass = MB_MClassType.normal.ordinal();
        } 
    }
    
    public Integer validity { get; set {
            if (validity < 0)
                throw new MB_MessageBirdService.ValidityException(Label.MB_InvalidValidity);
            validity = value;
        }
    }
    
    public MB_Message(String originator, String body, String recipients) {
        if (originator == null || originator.trim().length() == 0)
            throw new MB_MessageBirdService.IllegalArgumentException(Label.MB_OriginatorsMustBeSpecified);
        if (body == null || body.trim().length() == 0) {
            throw new MB_MessageBirdService.IllegalArgumentException(Label.MB_BodyMustBeSpecified);
        }
        if (recipients == null || recipients.trim().length() == 0) {
            throw new MB_MessageBirdService.IllegalArgumentException(Label.MB_RecipientsMustBeSpecified);
        }    

        this.originator = originator.trim();
        this.originator = this.originator.substring(0, Math.min(17, this.originator.length()));
        this.body = body.trim();
        this.recipients = recipients;
    }

    public MB_Message(String originator, String body, List<Long> recipients){
        this(originator, body, MB_MessageUtilities.recipientsAsCommaSeparated(recipients));
    }

    public void setPremiumSMS(Object shortcode, Object keyword, Object tariff, Object mid) {
        final Map<String, Object> premiumSMSConfig = new Map<String, Object>();
        premiumSMSConfig.put('shortcode', shortcode);
        premiumSMSConfig.put('keyword', keyword);
        premiumSMSConfig.put('tariff', tariff);
        premiumSMSConfig.put('mid', mid);
        this.typeDetails = premiumSMSConfig;
        this.type = MB_MsgType.premium;
    }
    
    public static MB_Message createBinarySMS(String originator, String header, String body, String recipients) {
        MB_Message msg = new MB_Message(originator, body, recipients);
        final Map<String, Object> binarySMS = new Map<String, Object>();
        binarySMS.put('udh', header);
        msg.typeDetails = binarySMS;
        msg.type = MB_MsgType.binary;
        return msg;
    }
    
    public static MB_Message createBinarySMS(String originator, String header, String body, List<long> recipients) {
        return MB_Message.createBinarySMS(originator, header, body, MB_MessageUtilities.recipientsAsCommaSeparated(recipients));
    }

}
