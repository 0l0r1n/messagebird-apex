public with sharing class MB_VerifyRequest {

    public String recipient { get; private set; }
    public String originator { get; set; }
    public String reference { get; set; }
    public MB_MsgType type { get; set; }
    public String template { get; set; }
    public Integer timeout { get; set; }
    public Integer tokenLength { get; set; }
    public MB_Gender voice { get; set; }
    public MB_Language language { get; set; }
    public MB_DataCodingType datacoding = MB_DataCodingType.plain;

    public MB_VerifyRequest(String recipient) {
        this.recipient = recipient;
    }
}
