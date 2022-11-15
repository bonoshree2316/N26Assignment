/*
* Name            :    CustomerProductHandlerTest
* Description     :    This is the test class for CustomerProductHandler
* Created Date    :    [14th Nov , 2022]
* Created By      :    [Bonoshree Mondal]
*
* Date Modified        Modified By             Description of the update
   14th-Nov-2022     Bonoshree Mondal          Created
*/
@isTest()
public class CustomerProductHandlerTest {
 
    static testmethod void getCustomerProductTest() {
        // prepare test-data
        Case c = TestUtility.createCase(true);
        TestUtility.createProdTable(true);
    
        Test.startTest();
        CustomerProductWrapper cpw = CustomerProductHandler.getCustomerProduct(c.Id);
        Test.stopTest();
    
        System.assertEquals(cpw.productName, 'Standard');
    }
}