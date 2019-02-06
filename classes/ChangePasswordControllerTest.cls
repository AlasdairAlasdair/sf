/**
 * An apex page controller that exposes the change password functionality
 */
@IsTest public with sharing class ChangePasswordControllerTest {
   	public static int testCrudViolation() {
         [select somethingelse__c from something__c];
         System.assertEquals(1,1);
         return 1;

      }
}
