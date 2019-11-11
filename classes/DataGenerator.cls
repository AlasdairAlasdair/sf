global class DataGenerator implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<String> firstNames = new List<String>{'Alan','Ben','Chris','Dave','Evan'};
        List<String> lastNames = new List<String>{'Aaronson','Benson','Chrisson','Davidson','Evanson'};
        
        Integer randomFirstNameIndex = Integer.valueof((Math.random() * (firstNames.size() - 1)));
        Integer randomLastNameIndex = Integer.valueof((Math.random() * (lastNames.size() - 1)));
        String randomName = firstNames[randomFirstNameIndex] + lastNames[randomLastNameIndex];

        Account a = new Account();
        String now = Datetime.now().format();
        a.Name = randomName;
        insert a;
    }   
}