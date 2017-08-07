public with sharing class MB_MessageBirdWebService {

    private static final String ENDPOINT = 'https://rest.messagebird.com';

    public static Object requestById(String path, String id, Type t){
        return JSON.deserialize(doCallout(path + '/' + id, null, 'GET'), t);
    }

    public static Object requestById(String path, String id, Map<String, Object> params, Type t){
        return JSON.deserialize(doCallout(path + '/' + id + '?' + Util_Http.buildQueryParams(params), null, 'GET'), t);
    }

    public static void deleteById(String path, String id){
        doCallout(path + '/' + id, null, 'DELETE');
    }

    public static Object requestList(String path, Integer offset, Integer limit_x, Type t){
        Map<String, Object> queryParams = new Map<String, Object>();
        if (limit_x != null) queryParams.put('limit', limit_x);
        if (offset != null) queryParams.put('offset', offset);
        String response = doCallout(path + '?' + Util_Http.buildQueryParams(queryParams), null, 'GET');
        return JSON.deserialize(response.replace('limit', 'limit_x'), t);
    }

    public static Object sendPayload(String path, Object payload, Type t){
        return JSON.deserialize(doCallout(path, JSON.serialize(payload), 'POST'), t);
    }

    public static Object sendPayload(String path, String id, Object payload, Type t){
        return JSON.deserialize(doCallout(path + '/' + id, JSON.serialize(payload), 'PATCH'), t);
    }

    private static String doCallout(String path, String body, String method) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod(method);
        request.setEndpoint(ENDPOINT + path);
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Authorization','AccessKey ' + Util_Env.getValue('MB_AccessKey'));
        if (body != null) request.setBody(body);
        HttpResponse response = http.send(request);
        System.debug(response.getBody());
        return response.getBody();
    }
}
