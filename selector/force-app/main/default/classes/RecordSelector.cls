public class RecordSelector
{
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList()
    {  
        List<Account> acc = new List<Account>();
        for(Account x: [select id,Name, AccountNumber, Type, Phone, Rating from Account limit 5] ){
            system.debug(x);
            acc.add(x);
        }        
        return acc;
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountById(Id recordid)
    {  
        return [select id,Name, Type, Phone, Rating from Account where Id=: recordid];
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountByName(String accountName)
    {  
        List<Account> acc = [select id,Name, Type, Phone, Rating from Account where Name=: accountName];
        system.debug(acc);
        return acc;
    } 
    
    //Opportunity
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunityList()
    {  
        List<Opportunity> opp = [select id,Name, StageName, CloseDate from Opportunity limit 5];
        system.debug(opp);
        return opp;
    }  
    
    //Case
    @AuraEnabled(cacheable=true)
    public static List<case> getCaseList()
    {  
        List<Case> cs = [select id,Origin,Reason,CaseNumber,OwnerId from Case limit 5];
        system.debug(cs);
        return cs;
    }  
 	
    @AuraEnabled(cacheable=true)
    public static List<case> getCaseByCaseNumber(String caseNumber)
    {  
        List<Case> cs = [select id,Origin,Reason,CaseNumber,OwnerId from Case where CaseNumber=: caseNumber];
        system.debug(cs);
        return cs;
    }    
}