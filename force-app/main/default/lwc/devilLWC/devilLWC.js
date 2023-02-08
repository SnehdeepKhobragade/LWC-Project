import { LightningElement,wire} from 'lwc';  
import { publish, MessageContext } from 'lightning/messageService';  
import searchMessage from '@salesforce/messageChannel/GitSearchChannel__c';  
 
export default class DevilLWC extends LightningElement {  
@wire(MessageContext)  
messageContext; 
message;  
 
handleClick(event){  
let inputvalue=this.template.querySelectorAll("lightning-input")[0].value;  
const payload = { isTermvalid:true, searchTerm:inputvalue };  
 
    publish(this.messageContext, searchMessage, payload);  
} 
 
     
}