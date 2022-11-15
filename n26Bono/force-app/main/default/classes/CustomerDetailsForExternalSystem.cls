/*
* Name            :    CustomerDetailsForExternalSystem
* Description     :    This is the Restresource apex class for external system to get the customer prod information by their UUID
* Created Date    :    [14th Nov , 2022]
* Created By      :    [Bonoshree Mondal]
*
* Date Modified        Modified By             Description of the update
   14th-Nov-2022     Bonoshree Mondal          Created
*/
@RestResource(urlMapping='/getCustomerDetails/*')
global class CustomerDetailsForExternalSystem {
    
    @HttpGet
    global static CustomerDetailsForExternalSystem.ResponseWrapper getCustomerDetails() {
        ResponseWrapper response = new ResponseWrapper();
        try{
            RestRequest request = RestContext.request;
            // grab the UUID from the end of the URL
            String UUID = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1);
            Contact con = [select id, product__c, Home_Country__c from Contact where UUID__c =: UUID];
            Product_Table__c pt = [select id, Country__c, Product_Name__c,Cost_Per_Calendar_Month__c, CurrencyIsoCode, Card_Replacement_Cost__c, ATM_Fee_in_Other_Currency__c from Product_Table__c where Product_Name__c =: con.product__c and Country__c =: con.Home_Country__c];
            response.cpw = new CustomerProductWrapper(pt, con.Id);
        }
        catch (Exception ex) {
            system.debug(ex.getMessage());
            response.errorMessage = ex.getMessage();
        }
        
        return response;
    }
    
    global class ResponseWrapper {

    @AuraEnabled
    public CustomerProductWrapper cpw ;

    @AuraEnabled
    public String errorMessage ;
    	    
    }
    
    
}