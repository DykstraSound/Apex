import { LightningElement, track } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class LaunchFlowRedirect extends NavigationMixin(LightningElement) {
    @track showFlow = true;

    handleStatusChange(event) {
        if (event.detail.status === 'FINISHED') {
            const outputs = event.detail.outputVariables || [];
            const redirectOutput = outputs.find(o => o.name === 'redirectURL');
            if (redirectOutput && redirectOutput.value) {
                this[NavigationMixin.Navigate]({
                    type: 'standard__webPage',
                    attributes: {
                        url: redirectOutput.value
                    }
                });
            }
        }
    }
}
