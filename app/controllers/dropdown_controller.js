import { Controller } from "@hotwired/stimulus";

// connect to data-controller = "dropdown"
export default class extends Controller {
    submit() {
        this.element.requestSubmit();
    }
}