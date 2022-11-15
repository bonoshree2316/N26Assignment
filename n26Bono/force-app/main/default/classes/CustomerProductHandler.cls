/*
* Name            :    CustomerDetailsForExternalSystem
* Description     :    This is the LWC handler class to show the customer production info on the case detail page
* Created Date    :    [14th Nov , 2022]
* Created By      :    [Bonoshree Mondal]
*
* Date Modified        Modified By             Description of the update
   14th-Nov-2022     Bonoshree Mondal          Created
*/
public class CustomerProductHandler {
	@AuraEnabled(cacheable=true)
    public static CustomerProductWrapper getCustomerProduct(String recordId){
       Case c = [select id, contactId, contact.product__c, contact.Home_Country__c from Case where id =: recordId];
        Product_Table__c pt = [select id, Country__c, Product_Name__c,Cost_Per_Calendar_Month__c, CurrencyIsoCode, Card_Replacement_Cost__c, ATM_Fee_in_Other_Currency__c from Product_Table__c where Product_Name__c =: c.contact.product__c and Country__c =: c.contact.Home_Country__c];
        CustomerProductWrapper cpw = new CustomerProductWrapper(pt, c.ContactId);
        return cpw;
    }
}