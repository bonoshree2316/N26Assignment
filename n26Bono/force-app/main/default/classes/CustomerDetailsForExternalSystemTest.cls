/*
* Name            :    CustomerDetailsForExternalSystem
* Description     :    This is the test class for CustomerDetailsForExternalSystem
* Created Date    :    [14th Nov , 2022]
* Created By      :    [Bonoshree Mondal]
*
* Date Modified        Modified By             Description of the update
   14th-Nov-2022     Bonoshree Mondal          Created
*/
@isTest()
public class CustomerDetailsForExternalSystemTest {
 
    static testmethod void getCustomerDetailsTest() {
        // prepare test-data
        TestUtility.createContact(true);
        TestUtility.createProdTable(true);
        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();
        req.requestURI = '/services/apexrest/getCustomerDetails/1234'; //Request URL
        req.httpMethod = 'GET';
    
        RestContext.request = req;
        RestContext.response= res;
    
        Test.startTest();
            CustomerDetailsForExternalSystem.ResponseWrapper response = CustomerDetailsForExternalSystem.getCustomerDetails();
        Test.stopTest();
    
        System.assertEquals(response.cpw.productName, 'Standard');
    }
}