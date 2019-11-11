global class DataGenerator implements Schedulable {
    private static List<String> firstNames = new List<String>{'Alan','Ben','Chris','Dave','Evan'};
    private static List<String> lastNames = new List<String>{'Aaronson','Benson','Chrisson','Davidson','Evanson'};

    private String GenerateRandomName() {
        Integer randomFirstNameIndex = Integer.valueof((Math.random() * (firstNames.size() - 1)));
        Integer randomLastNameIndex = Integer.valueof((Math.random() * (lastNames.size() - 1)));        
        String randomName = firstNames[randomFirstNameIndex] + ' ' + lastNames[randomLastNameIndex];
        return randomName;
    }
    
    private String GenerateRandomPhone() {
        String randomPhone = String.valueOf(Integer.valueof((Math.random() * 100000000)));
        return randomPhone;
    }
    
    private void CreateRandomAccount() {
        Account a = new Account();
      	a.Name = GenerateRandomName();
       	a.Phone = GenerateRandomPhone();
      	insert a; 
    }
    
    private Account GetRandomAccount(){
        Integer accountsCount = [SELECT COUNT() FROM Account];
		Integer randomAccountIndex = Math.floor(Math.random() * accountsCount).intValue();
		return [SELECT Name FROM Account LIMIT 1 OFFSET :randomAccountIndex];
    }
    
    private void DeleteRandomAccount() {
		Account accountToDelete = GetRandomAccount();
       	delete accountToDelete;
    }
    
	private void EditRandomAccount() {
        Account accountToEdit = GetRandomAccount();
        accountToEdit.Name = GenerateRandomName();
        accountToEdit.Phone = GenerateRandomPhone();
        update accountToEdit;
    }
    
	global void execute(SchedulableContext ctx) {
        CreateRandomAccount();
       	DeleteRandomAccount();
        EditRandomAccount();
        String now = Datetime.now().format();  
        System.debug('Data munger ran @ ' + now);
   }   
}