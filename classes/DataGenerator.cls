global class DataGenerator implements Schedulable {

    private Integer GetRandomNumber(Integer multiplier) {
        return Integer.valueof(Math.random() * multiplier);
    }

    private String GenerateRandomName() {
        Integer randomFirstNameIndex = GetRandomNumber(Names.FirstNames.size() - 1);
        Integer randomInitialIndex = GetRandomNumber(Names.Initials.size() - 1);
        Integer randomLastNameIndex = GetRandomNumber(Names.LastNames.size() - 1);        
        String randomName = Names.FirstNames[randomFirstNameIndex] + ' ' + Names.Initials[randomInitialIndex] + '. ' + Names.LastNames[randomLastNameIndex];
        return randomName;
    }
    
    private String GenerateRandomPhone() {
        String randomAreaCode = String.valueOf(GetRandomNumber(1000));
        String randomMiddleBit = String.valueOf(GetRandomNumber(1000));
        String randomLastBit = String.valueOf(GetRandomNumber(100000));
        return '(' + randomAreaCode + ') ' + randomMiddleBit + ' ' + randomLastBit;
    }

    private Boolean GenerateRandomBool() {
        Integer oneOrZero = GetRandomNumber(2);
        return oneOrZero == 1;
    }
    
    private String GetRandomString(Integer stringLength) {
        String randomString = '';

        for (Integer i = 0; i < stringLength; i++) {
            Integer randomInitialIndex = GetRandomNumber(Names.Initials.size() - 1);
            randomString += Names.Initials[randomInitialIndex];
        }

        return randomString;
    }

    private void CreateRandomAccount() {
        Account newAccount = new Account();
        newAccount.Name = GenerateRandomName();
        newAccount.Phone = GenerateRandomPhone();
        insert newAccount;
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
    
    private void CreateRandomCase() {
        Case newCase = new Case();
        caseToEdit.IsClosed = GenerateRandomBool();
        caseToEdit.IsEscalated = GenerateRandomBool();
        caseToEdit.Reason = GetRandomString(10);
        insert newCase;
    }
    
    private Case GetRandomCase(){
        Integer casesCount = [SELECT COUNT() FROM Case];
        Integer randomCaseIndex = Math.floor(Math.random() * casesCount).intValue();
        return [SELECT Name FROM Case LIMIT 1 OFFSET :randomCaseIndex];
    }
    
    private void DeleteRandomCase() {
        Case caseToDelete = GetRandomCase();
        delete caseToDelete;
    }
    
    private void EditRandomCase() {
        Case caseToEdit = GetRandomCase();
        caseToEdit.IsClosed = !caseToEdit.IsClosed;
        caseToEdit.IsEscalated = !caseToEdit.IsEscalated;
        caseToEdit.Reason = GetRandomString(10);
        update caseToEdit;
    }
    
    private void CreateRandomContact() {
        Contact newContact = new Contact();
        // TODO
        insert newContact;
    }
    
    private Contact GetRandomContact(){
        Integer contactsCount = [SELECT COUNT() FROM Contact];
        Integer randomContactIndex = Math.floor(Math.random() * contactsCount).intValue();
        return [SELECT Name FROM Contact LIMIT 1 OFFSET :randomContactIndex];
    }
    
    private void DeleteRandomContact() {
        Contact contactToDelete = GetRandomContact();
        delete contactToDelete;
    }
    
    private void EditRandomContact() {
        Contact contactToEdit = GetRandomContact();
        // TODO
        update contactToEdit;
    }
    
    private void DoAccountAction() {
        Integer actionIndex =  GetRandomNumber(3);
            
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
    
    private void DoCaseAction() {
        Integer actionIndex =  GetRandomNumber(3);
            
        switch on actionIndex {
            when 0 {
                CreateRandomCase();
            }
            when 1 {
                DeleteRandomCase();
            }
            when 2 {
                EditRandomCase();
            }
            when else {
                System.debug('default');
            }
        }
    }
    
    private void DoContactAction() {
        Integer actionIndex =  GetRandomNumber(3);
            
        switch on actionIndex {
            when 0 {
                CreateRandomContact();
            }
            when 1 {
                DeleteRandomContact();
            }
            when 2 {
                EditRandomContact();
            }
            when else {
                System.debug('default');
            }
        }
    }
    
    global void execute(SchedulableContext ctx) {
        
        for (Integer i = 0; i < 15; i++) {
            DoAccountAction();
            DoCaseAction();
            DoContactAction();
            // DoLeadAction();
            // DoOpportunityAction();
        }
        
        String now = Datetime.now().format();
        System.debug('Data munger ran @ ' + now);
   }   
}