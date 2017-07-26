public with sharing class Util_Http {
    
    public static String buildQueryParams(Map<String, Object> queryParams){
        String query = '';
        for (String key : queryParams.keySet()) {
            if (queryParams.size() > 1) {
                query += '&';
            }
            try {
                query += EncodingUtil.urlEncode(key, 'UTF-8') + '=' + EncodingUtil.urlEncode(String.valueOf(queryParams.get(key)), 'UTF-8');
            } catch (Exception e) {}
        }
        return query;
    }

}
