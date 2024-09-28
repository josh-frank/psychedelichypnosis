# Pin npm packages by running ./bin/importmap

pin "application"
pin "jquery" # @3.7.1
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
