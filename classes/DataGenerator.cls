global class DataGenerator implements Schedulable {

    private Integer GetRandomNumber(Integer multiplier) {
        return Integer.valueof(Math.random() * multiplier);
    }

    private String GenerateRandomFullName() {
        Integer randomInitialIndex = GetRandomNumber(Names.Initials.size() - 1);
        String randomFullName = GenerateRandomFirstName() + ' ' + Names.Initials[randomInitialIndex] + '. ' + GenerateRandomLastName();
        return randomFullName;
    }

    private String GenerateRandomFirstName() {
        Integer randomFirstNameIndex = GetRandomNumber(Names.FirstNames.size() - 1);
        return Names.FirstNames[randomFirstNameIndex];
    }
    
    private String GenerateRandomLastName() {
        Integer randomLastNameIndex = GetRandomNumber(Names.LastNames.size() - 1);
        return Names.LastNames[randomLastNameIndex];
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
    
    private String GenerateRandomCompany() {
        Integer randomSuffixIndex = GetRandomNumber(Names.CompanySuffixes.size() - 1);
        String randomSuffix = Names.CompanySuffixes[randomSuffixIndex];
        return GenerateRandomLastName() + randomSuffix;
    }
    
    private String GenerateRandomString(Integer stringLength) {
        String randomString = '';

        for (Integer i = 0; i < stringLength; i++) {
            Integer randomInitialIndex = GetRandomNumber(Names.Initials.size() - 1);
            randomString += Names.Initials[randomInitialIndex];
        }

        return randomString;
    }

    private void CreateRandomAccount() {
        Account newAccount = new Account();
        newAccount.Name = GenerateRandomFullName();
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
        accountToEdit.Name = GenerateRandomFullName();
        accountToEdit.Phone = GenerateRandomPhone();
        update accountToEdit;
    }
    
    private void CreateRandomCase() {
        Case newCase = new Case();
        newCase.IsEscalated = GenerateRandomBool();
        newCase.Reason = GenerateRandomString(GetRandomNumber(10));
        insert newCase;
    }
    
    private Case GetRandomCase() {
        Integer casesCount = [SELECT COUNT() FROM Case];
        Integer randomCaseIndex = Math.floor(Math.random() * casesCount).intValue();
        return [SELECT AccountId FROM Case LIMIT 1 OFFSET :randomCaseIndex];
    }
    
    private void DeleteRandomCase() {
        Case caseToDelete = GetRandomCase();
        delete caseToDelete;
    }
    
    private void EditRandomCase() {
        Case caseToEdit = GetRandomCase();
        caseToEdit.IsEscalated = !caseToEdit.IsEscalated;
        caseToEdit.Reason = GenerateRandomString(GetRandomNumber(10));
        update caseToEdit;
    }
    
    private void CreateRandomContact() {
        Contact newContact = new Contact();
        newContact.FirstName = GenerateRandomFirstName();
        newContact.LastName = GenerateRandomLastName();
        newContact.Description = GenerateRandomString(GetRandomNumber(20));
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
        contactToEdit.FirstName = GenerateRandomFirstName();
        contactToEdit.LastName = GenerateRandomLastName();
        contactToEdit.Description = GenerateRandomString(GetRandomNumber(20));
        update contactToEdit;
    }
    
    private void CreateRandomLead() {
        Lead newLead = new Lead();
        newLead.Company = GenerateRandomCompany();
        newLead.Phone = GenerateRandomPhone();
        insert newLead;
    }
    
    private Lead GetRandomLead(){
        Integer leadsCount = [SELECT COUNT() FROM Lead];
        Integer randomLeadIndex = Math.floor(Math.random() * leadsCount).intValue();
        return [SELECT Name FROM Lead LIMIT 1 OFFSET :randomLeadIndex];
    }
    
    private void DeleteRandomLead() {
        Lead leadToDelete = GetRandomLead();
        delete leadToDelete;
    }
    
    private void EditRandomLead() {
        Lead leadToEdit = GetRandomLead();
        leadToEdit.Company = GenerateRandomCompany();
        leadToEdit.Phone = GenerateRandomPhone();
        update leadToEdit;
    }
    
    private void CreateRandomOpportunity() {
        Opportunity newOpportunity = new Opportunity();
        newOpportunity.IsClosed = GenerateRandomBool();
        newOpportunity.Description = GenerateRandomString(GetRandomNumber(10));
        insert newOpportunity;
    }
    
    private Opportunity GetRandomOpportunity(){
        Integer opportunitiesCount = [SELECT COUNT() FROM Opportunity];
        Integer randomOpportunityIndex = Math.floor(Math.random() * opportunitiesCount).intValue();
        return [SELECT Name FROM Opportunity LIMIT 1 OFFSET :randomOpportunityIndex];
    }
    
    private void DeleteRandomOpportunity() {
        Opportunity opportunityToDelete = GetRandomOpportunity();
        delete opportunityToDelete;
    }
    
    private void EditRandomOpportunity() {
        Opportunity opportunityToEdit = GetRandomOpportunity();
        opportunityToEdit.IsClosed = GenerateRandomBool();
        opportunityToEdit.Description = GenerateRandomString(GetRandomNumber(10));
        update opportunityToEdit;
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

    private void DoLeadAction() {
        Integer actionIndex =  GetRandomNumber(3);
            
        switch on actionIndex {
            when 0 {
                CreateRandomLead();
            }
            when 1 {
                DeleteRandomLead();
            }
            when 2 {
                EditRandomLead();
            }
            when else {
                System.debug('default');
            }
        }
    }

    private void DoOpportunityAction() {
        Integer actionIndex =  GetRandomNumber(3);
            
        switch on actionIndex {
            when 0 {
                CreateRandomOpportunity();
            }
            when 1 {
                DeleteRandomOpportunity();
            }
            when 2 {
                EditRandomOpportunity();
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
            DoLeadAction();
            DoOpportunityAction();
        }
        
        String now = Datetime.now().format();
        System.debug('Data munger ran @ ' + now);
   }   
}