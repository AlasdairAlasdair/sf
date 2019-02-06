/**
 * An apex page controller that exposes the change password functionality
 */
@IsTest public with sharing class ChangePasswordControllerTest {
   	public static int testCrudViolation() {
         if (schema.SObjectType.something__c.fields.somethingelse__c.isAccessible() && schema.SObjectType.something__c.fields.somethingelse__c.isupdateable()){
            return 1;
            System.assertEquals(1,1);
         }
         return null;
      }
}
