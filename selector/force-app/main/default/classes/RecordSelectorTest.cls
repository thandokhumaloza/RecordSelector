@IsTest
private class RecordSelectorTest {
	static testMethod void recordSelector() {
        //Test Data
        Account a = new Account(Name='Edge Communications',AccountNumber='12345', Type='Customer - Direct', Phone='(512) 757-6000', Rating='Hot');
        Opportunity o = new Opportunity(AccountId= a.Id, Name='Edge Emergency Generator', StageName='Id. Decision Makers', CloseDate=Date.Today());
        Case c = new Case(AccountId = a.Id, Subject ='New Case');
        insert a;
        insert o;
        insert c;
        
        Case cs = [Select CaseNumber from Case where Id =: c.Id];
        List<Account> accList = [Select Id from Account Limit 5];
        List<Opportunity> oppList = [Select Id from Opportunity Limit 5];
        List<Case> caseList = [Select Id, CaseNumber from Case Limit 5];
        
        Test.startTest();
        List<Account> acc1 = RecordSelector.getAccountList();
        System.assertEquals(acc1.size(),accList.size());
        
        List<Account> acc2 = RecordSelector.getAccountById(a.Id);
        System.assertEquals(a.Id, acc2[0].Id);
        
        List<Account> acc3 = RecordSelector.getAccountByName('Edge Communications');
        System.assertEquals(acc3[0].Name, 'Edge Communications');
        
        List<Opportunity> opp1 = RecordSelector.getOpportunityList();
        System.assertEquals(oppList.size(),opp1.size());
        
        List<Case> cs1 = RecordSelector.getCaseList();
        System.assertEquals(cs1.size(),caseList.size());
        
        List<Case> cs2 = RecordSelector.getCaseByCaseNumber(cs.CaseNumber);
        System.assertEquals(cs1[0].CaseNumber,caseList[0].CaseNumber);
        
        Test.stopTest();        
    }
}