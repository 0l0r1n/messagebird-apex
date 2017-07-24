public class MB_MessageResponse {
    
    public String id { get; }
    public String href { get; }
    public String direction { get; }
    public MB_MsgType type { get; }
    public String originator { get; }
    public String body { get; }
    public String reference { get; }
    public Integer validity { get; }
    public Integer gateway { get; }
    public Map<String, Object> typeDetails { get; }
    public MB_DataCodingType datacoding = MB_DataCodingType.unicode;
    public MB_MClassType mclass { get; }
    public Date scheduledDatetime { get; }
    public Date createdDatetime { get; }
    public Recipients recipients { get; }

    class Recipients {
        public Integer totalSentCount { get; }
        public Integer totalDeliveredCount { get; }
        public Integer totalDeliveryFailedCount { get; }
        public List<Items> items { get; }
    }

    class Items {
        public Long recipient { get; }
        public String status { get; }
        public Date statusDateTime { get; }
    }
}
