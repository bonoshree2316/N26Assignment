/*
* Name            :    CustomerProductWrapper
* Description     :    This is the wrapper class for custommer product information
* Created Date    :    [14th Nov , 2022]
* Created By      :    [Bonoshree Mondal]
*
* Date Modified        Modified By             Description of the update
   14th-Nov-2022     Bonoshree Mondal          Created
*/
public class CustomerProductWrapper {

    @AuraEnabled
    public Decimal Cost_per_calender_month ;

    @AuraEnabled
    public Decimal ATM_fee_in_other_currency ;
    
	@AuraEnabled
    public Decimal Card_replacement_cost { get;set; }
    
    @AuraEnabled
    public string productName;
    
    @AuraEnabled
    public string country;
    
    @AuraEnabled
    public string currencyType;
    
    public CustomerProductWrapper(Product_Table__c pt, Id conId){
        this.productName = pt.Product_Name__c;
        this.country = pt.Country__c;
        this.currencyType = pt.CurrencyIsoCode;
        this.Cost_per_calender_month = pt.Cost_Per_Calendar_Month__c;
        this.ATM_fee_in_other_currency = pt.ATM_Fee_in_Other_Currency__c;
        this.Card_replacement_cost = pt.Card_Replacement_Cost__c;
        this.discount();
    }
    private void discount(){
        // discount logic based on period of subscription or other factors
    }

    
}