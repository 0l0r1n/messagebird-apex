public class MB_MessageUtilities {
    
    public static String recipientsAsCommaSeparated(List<Long> recipients) {
        if (recipients == null) {
            return null;
        }
        if (recipients.size() == 0) {
            return '';
        }
        String recipientsAsString = '';
        for (Long l : recipients) {
            recipientsAsString = String.valueOf(l) + ',';
        }
        
        return recipientsAsString.substring(0, recipientsAsString.length() - 1);
    }
    
}
