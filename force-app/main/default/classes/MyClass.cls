public with sharing class MyClass {

    public static void updateDate(List<Warehouse__c> warehouses){
        List<Warehouse__c> houses = [SELECT CreatedDate FROM Warehouse__c ORDER BY CreatedDate DESC NULLS FIRST];
        Datetime dt;
        for(Warehouse__c wh : houses){
            dt = wh.CreatedDate;
            break;
        }

        Map<Id, Book__c> books = new Map<Id, Book__c>();
        for(Warehouse__c wh : warehouses) {
            if(dt != null) {
                books.put(wh.Book__c, new Book__c( Id = wh.Book__c, Trigger_Field__c = dt));
            }
        }
      	update books.values();
    }    
}