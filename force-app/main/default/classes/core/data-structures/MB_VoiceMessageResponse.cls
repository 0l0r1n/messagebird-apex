public with sharing class MB_VoiceMessageResponse {
    public String id { get; }
    public String href { get; }
    public String originator { get; }
    public String body { get; }
    public String reference { get; }
    public String language { get; }
    public MB_VoiceType voice { get; }
    public Integer repeat { get; }
    public MB_IfMachineType ifMachine { get; }
    public Date scheduledDatetime { get; }
    public Date createdDatetime { get; }
    public MB_MessageResponse.Recipients recipients { get; }

}
