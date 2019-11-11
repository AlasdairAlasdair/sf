global class DataGenerator implements Schedulable {
    private static List<String> firstNames = new List<String>{
        'Olivia',
        'Emily',
        'Isla',
        'Sophie',
        'Amelia',
        'Ella',
        'Ava',
        'Grace',
        'Aria',
        'Jessica',
        'Charlotte',
        'Sophia',
        'Freya',
        'Lucy',
        'Lily',
        'Evie',
        'Harper',
        'Ellie',
        'Eilidh',
        'Mia',
        'Millie',
        'Anna',
        'Emma',
        'Ruby',
        'Maisie',
        'Jack',
        'Oliver',
        'James',
        'Logan',
        'Leo',
        'Lewis',
        'Alexander',
        'Harris',
        'Noah',
        'Rory',
        'Charlie',
        'Harry',
        'Lucas',
        'Jacob',
        'Thomas',
        'Alfie',
        'Archie',
        'Max',
        'Finlay',
        'Finn',
        'Adam',
        'Daniel',
        'Ethan',
        'Mason',
        'Brodie'
    };

    private static List<String> initials = new List<String>{
        'A',
        'B',
        'C',
        'D',
        'E',
        'F',
        'G',
        'H',
        'I',
        'J',
        'K',
        'L',
        'M',
        'N',
        'O',
        'P',
        'Q',
        'R',
        'S',
        'T',
        'U',
        'V',
        'W',
        'X',
        'Y',
        'Z'
    };

    private static List<String> lastNames = new List<String>{
        'Smith',
        'Jones',
        'Taylor',
        'Brown',
        'Williams',
        'Wilson',
        'Johnson',
        'Davies',
        'Robinson',
        'Wright',
        'Thompson',
        'Evans',
        'Walker',
        'White',
        'Roberts',
        'Green',
        'Hall',
        'Wood',
        'Jackson',
        'Clarke'
	};

    private String GenerateRandomName() {
        Integer randomFirstNameIndex = Integer.valueof((Math.random() * (firstNames.size() - 1)));
        Integer randomInitialIndex = Integer.valueof((Math.random() * (initials.size() - 1)));
        Integer randomLastNameIndex = Integer.valueof((Math.random() * (lastNames.size() - 1)));        
        String randomName = firstNames[randomFirstNameIndex] + ' ' + initials[randomInitialIndex] + '. ' + lastNames[randomLastNameIndex];
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
    
    private void DoAction() {
        Integer actionIndex =  Integer.valueof((Math.random() * 3));
            
        switch on actionIndex {
            when 0 {
                CreateRandomAccount();
            }
            when 1 {
                DeleteRandomAccount();
            }
            when 2 {
                EditRandomAccount();
            }
            when else {
                System.debug('default');
            }
        }
    }
    
	global void execute(SchedulableContext ctx) {
        
        for (Integer i = 0; i < 15; i++) {
            DoAction();
        }
        
        String now = Datetime.now().format();
        System.debug('Data munger ran @ ' + now);
   }   
}