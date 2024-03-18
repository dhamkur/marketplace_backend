import { Controller } from "@hotwired/stimulus";
import TomSelect from "tom-select";

export default class extends Controller {
  connect() {
    const tomSelect = document.querySelector("#tom-select");
    const url = tomSelect.getAttribute("url");
    const param = tomSelect.getAttribute("param");
    const selected = JSON.parse(tomSelect.getAttribute("selected_data"));

    new TomSelect("#tom-select", {
      create: true,
      valueField: "id",
      labelField: "name",
      searchField: "name",
      options: [selected],
      items: [selected.id],
      // fetch remote data
      load: async function (query, callback) {
        let uri = url + param + encodeURIComponent(query);

        await fetch(uri)
          .then((response) => response.json())
          .then((json) => {
            callback(json);
          })
          .catch(() => {
            callback();
          });
      },
      render: {
        // custom rendering functions for options and items
        option: function (item, escape) {
          return `
            <div class="mb-1">
              <span class="h5">
                ${escape(item.name)}
              </span>
            </div>
          `;
        },
        item: function (item, escape) {
          return `
            <div class="mb-1">
              <span class="h5">
                ${escape(item.name)}
              </span>
            </div>
          `;
        },
      },
    });
  }
}
