import {  api,LightningElement } from 'lwc';
export default class LwcDevil extends LightningElement {
    @api retrivedUser;
    handlebuttonClick(){
        const selectedEvent = new CustomEvent('userclicked', { detail: this.retrivedUser.login });
        // Dispatches the event.
        this.dispatchEvent(selectedEvent);
    }
}