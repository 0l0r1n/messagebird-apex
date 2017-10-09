public class MB_Contact {
    
    public String id { get; set; }
    public String href { get; set; }
    public Long msisdn { get; private set; }
    public String firstName { get; set; }
    public String lastName { get; set; }
    public String createdDatetime { get; set; }
    public String updatedDatetime { get; set; }
    public CustomDetails customDetails { get; set; }
    public Hash groups { get; set; }
    public Hash messages { get; set; }

    public MB_Contact(Long msisdn) {
        if (msisdn == null)
            throw new MB_MessageBirdService.IllegalArgumentException(Label.MB_PhoneNumberMustBeSpecified);
        this.msisdn = msisdn;
    }

    public MB_Contact(Long msisdn, String firstName, String lastName, CustomDetails customDetails) {
        this(msisdn);
        this.firstName = firstName;
        this.lastName = lastName;
        this.customDetails = customDetails;
    }

    public class CustomDetails {

        public String custom1 { get; set; }
        public String custom2 { get; set; }
        public String custom3 { get; set; }
        public String custom4 { get; set; }

    }

    public class Hash {
        public Integer totalCount { get; set; }
        public String href { get; set; }
    }

}
