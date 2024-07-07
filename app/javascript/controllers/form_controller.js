import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["source"];

  search() {
    // wait if the user already finish typing
    clearTimeout(this.timeout);
    this.timeout = setTimeout(() => {
      this.sourceTarget.requestSubmit();
    }, 1500);
  }

  reset() {
    this.element.reset();
  }
}
