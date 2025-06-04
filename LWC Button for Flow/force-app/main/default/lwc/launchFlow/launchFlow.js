import { LightningElement, track } from 'lwc';

export default class LaunchFlow extends LightningElement {
    @track isModalOpen = false;

    openFlowModal() {
        this.isModalOpen = true;
    }

    closeModal() {
        this.isModalOpen = false;
    }

    handleStatusChange(event) {
        if (event.detail.status === 'FINISHED') {
            this.closeModal();
        }
    }
}
