global class DataGenerator implements Schedulable {

// This test runs a scheduled job at midnight Sept. 3rd. 2022

//    public static String CRON_EXP = '0 0 0 3 9 ? 2022';
    public static String CRON_EXP = '30 * * * * ?';
   
    global void execute(SchedulableContext ctx) {
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime
                            FROM CronTrigger WHERE Id = :ctx.getTriggerId()];

        System.assertEquals(CRON_EXP, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
        System.assertEquals('2022-09-03 00:00:00', String.valueOf(ct.NextFireTime));

        String now = Datetime.now().format();
        Account account = new Account();
        account.Name = 'hello from cron at' + now;
        insert account;
      
        Account a = [SELECT Id, Name FROM Account WHERE Name = 
                    'testScheduledApexFromTestMethod'];
        a.name = 'testScheduledApexFromTestMethodUpdated';
        update a;
   }   
}