trigger MyTrigger on Warehouse__c (after insert) {
	if(Trigger.isAfter){
        MyClass.updateDate(Trigger.new);
    }
}