import { LightningElement, wire, api } from 'lwc';
import getCustomerProduct from '@salesforce/apex/CustomerProductHandler.getCustomerProduct';
export default class Customer_prod_info extends LightningElement {
    data;
    error;
    @api recordId;
    @wire(getCustomerProduct , { recordId: '$recordId' })
    wiredRecordsMethod({ error, data }) {
        if (data) {
            this.data  = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.data  = undefined;
        }
    }

    
}