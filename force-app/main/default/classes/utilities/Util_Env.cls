public with sharing class Util_Env {
    private static Map<String, Key_Value_Pair__mdt> kvpRecords;

    private static void populateKvpRecords() {
        kvpRecords = new Map<String, Key_Value_Pair__mdt>();
        List<Key_Value_Pair__mdt> kvps = [ SELECT DeveloperName, Value__c from Key_Value_Pair__mdt ];
        for (Key_Value_Pair__mdt kvp : kvps) kvpRecords.put(kvp.DeveloperName, kvp);
    }

    public static String getValue(String key) {
        if (kvpRecords == null) populateKvpRecords();
        return kvpRecords.get(key).Value__c;
    }

    public static String getEnvValue(String key) {
        return getValue(key + (getIsSandbox() ? '_sbx' : '_prd' ));
    }

    public static boolean getIsSandbox(){
		return [SELECT IsSandbox FROM Organization limit 1].IsSandbox;
	}
    
}
