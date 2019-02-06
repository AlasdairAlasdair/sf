/**
 * An apex page controller that exposes the change password functionality
 */
@IsTest public with sharing class ChangePasswordControllerTest {
   	public static int testCrudViolation() {
         if (schema.SObjectType.something__c.fields.somethingelse__c.isAccessible() && schema.SObjectType.something__c.fields.somethingelse__c.isupdateable()){
            [select somethingelse__c from something__c];
            System.assertEquals(1,1);
            return 1;
         }
         return null;
      }
}
