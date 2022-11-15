/*
* Name            :    TestUtility
* Description     :    This is the Utility method for the test class for test data creation.
* Created Date    :    [14th Nov , 2022]
* Created By      :    [Bonoshree Mondal]
*
* Date Modified        Modified By             Description of the update
   14th-Nov-2022     Bonoshree Mondal          Created
*/
public class TestUtility {
    public static Account createAccount(Boolean isInsert) {
        Account account = new Account(Name = 'Test Account');

        if(isInsert) {
          insert account;
        }
        system.assert(true);

        return account;
    }
    
    public static Contact createContact(Boolean isInsert) {
        Account account = TestUtility.createAccount(true);
        Contact cont = new Contact();
        cont.FirstName='Test';
        cont.LastName='Test';
        cont.Accountid= account.id;
        cont.UUID__c = '1234';
        cont.Product__c = 'Standard';
        cont.Home_Country__c = 'ES';

        if(isInsert) {
          insert cont;
        }
        system.assert(true);

        return cont;
    }
    
    public static Case createCase(Boolean isInsert) {
        Contact con = TestUtility.createContact(true);
        Case c = new Case();
        c.contactId = con.Id;
        if(isInsert) {
          insert c;
        }
        system.assert(true);

        return c;
    }
    
    public static Product_Table__c createProdTable(Boolean isInsert) {
        Product_Table__c pt = new Product_Table__c();
        pt.Product_Name__c = 'Standard';
        pt.Cost_Per_Calendar_Month__c = 0;
        pt.ATM_Fee_in_Other_Currency__c = 1.70;
        pt.Card_Replacement_Cost__c = 6;
        pt.Country__c = 'ES';

        if(isInsert) {
          insert pt;
        }
        system.assert(true);

        return pt;
    }
    
    
}