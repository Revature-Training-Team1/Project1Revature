import { LightningElement } from 'lwc';

export default class helloWorld extends LightningElement {
    greeting = 'World Wide Events for Internet Sites and Stores';
    changeHandler(event)
    {
        this.greeting = event.target.value;
    }
}