public class MB_MessageList {

    public Integer offset { get; }
    public Integer limit_x { get; }
    public Integer totalCount { get; }
    public MB_Links links { get; }
    public List<MB_MessageResponse.Items> items { get; }

}
