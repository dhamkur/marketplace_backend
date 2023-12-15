import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["name"];

  select() {
    const element = this.nameTarget;
    const value = element.value;

    console.log(value);

    if (value !== undefined) {
      const collapseVariant = document.querySelector("#collapse-variant");
      const variantPrice = document.querySelector("#variant-price");
      const variantStock = document.querySelector("#variant-stock");

      collapseVariant.classList.remove("d-none");
      variantPrice.innerHTML = element.getAttribute("data-price");
      variantStock.innerHTML = element.getAttribute("data-stock");
    }
  }
}
