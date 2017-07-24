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
    public Date scheduledDatetime { get; }
    public Date createdDatetime { get; }
    public Recipients recipients { get; }
    public MB_MClassType mclass { 
        get; set {
            if (value.ordinal() == 0) mclass = MB_MClassType.flash;
            else mclass = MB_MClassType.normal;
        }
    }

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
