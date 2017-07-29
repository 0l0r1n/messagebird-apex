public class MB_ErrorReport {

    public Integer code { get; private set; }
    public String description { get; private set; }
    public String parameter { get; private set; }

    public MB_ErrorReport() {}

    public MB_ErrorReport(Integer code, String description, String parameter) {
        this.code = code;
        this.description = description;
        this.parameter = parameter;
    }

}
