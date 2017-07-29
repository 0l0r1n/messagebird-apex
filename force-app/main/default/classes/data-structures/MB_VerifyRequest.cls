public with sharing class MB_VerifyRequest {

    public String recipient { get; private set; }
    public String originator { get; set; }
    public String reference { get; set; }
    public MB_MsgType type { get; set; }
    public String template { get; set; }
    public Integer timeout { get; set; }
    public Integer tokenLength { get; set; }
    public MB_Gender voice { get; set; }
    public MB_DataCodingType datacoding = MB_DataCodingType.plain;
    public String language { 
        get; set {
            if (!MB_Language.valueSet.contains(value))
                throw new MB_MessageBirdService.IllegalArgumentException(Label.MB_InvalidLanguage);
        }
    }

    public MB_VerifyRequest(String recipient) {
        this.recipient = recipient;
    }
}
