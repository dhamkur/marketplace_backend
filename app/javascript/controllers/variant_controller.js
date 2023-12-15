import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["name"];

  select() {
    const element = this.nameTarget;
    const value = element.value;

    if (value !== undefined) {
      const collapseVariant = document.querySelector("#collapse-variant");
      const variantPrice = document.querySelector("#variant-price");
      const variantStock = document.querySelector("#variant-stock");
      const variantId = document.querySelector("[name='variant_id']");

      collapseVariant.classList.remove("d-none");
      variantPrice.innerHTML = `$${element.getAttribute("data-price")}`;
      variantStock.innerHTML = element.getAttribute("data-stock");
      variantId.value = value;
    }
  }
}
