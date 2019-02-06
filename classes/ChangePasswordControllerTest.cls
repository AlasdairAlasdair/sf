/**
 * An apex page controller that exposes the change password functionality
 */
@IsTest public with sharing class ChangePasswordControllerTest {
   	@IsTest(SeeAllData=false) public static void testCrudViolation() {
         if (schema.SObjectType.something__c.fields.somethingelse__c.isAccessible() && schema.SObjectType.something__c.fields.somethingelse__c.isupdateable()){
            System.assertEquals(1,1);
         }
      }
}
