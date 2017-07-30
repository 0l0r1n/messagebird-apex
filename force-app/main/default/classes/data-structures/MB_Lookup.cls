public class MB_Lookup {
    
    public String href;
    public String countryCode;
    public Integer countryPrefix;
    public Long phoneNumber;
    public String type;
    public Formats formats;
    public MB_LookupHlr hlr;

    public MB_Lookup(){}

    public MB_Lookup(Long phoneNumber){
        this.phoneNumber = phoneNumber;
    }
    
    public class Formats {

        public String e164 { get; set; }
        public String international { get; set; }
        public String national { get; set; }
        public String rfc3966 { get; set; }

    }
}
