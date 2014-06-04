// Resource declarations for Resources plugin
modules = {
    // YUI plugin does not currently define this one.
    'grailsui-yui-sam' {
        resource url: [plugin: "yui", dir: "/js/yui/assets/skins/sam", file: "skin.css"]
    }

    'grailsui-styles' {
        resource url: [plugin: "grails-ui", dir: "css/grailsui", file: "grails-ui.css"]
    }

    'grailsui-expandable-datatable' {
        resource url: [plugin: "grails-ui", dir: "css/grailsui", file: "datatable.css"]
        resource url: [plugin: "grails-ui", dir: "js/grailsui", file: "DataTable.js"], disposition: "head"
    }

    'grailsui-loading-dialog' {
        resource url: [plugin: "grails-ui", dir: "js/grailsui", file: "LoadingDialog.js"], disposition: "head"
    }

    'grailsui-core' {
        dependsOn "yui-core"

        resource url: [plugin: "grails-ui", dir: "js/grailsui", file: "grailsui.js"], disposition: "head"
    }

    'grailsui-overlay' {
        dependsOn "yui-fonts", "yui-container", "grailsui-core"
    }

    'grailsui-menu' {
        dependsOn "yui-fonts", "yui-menu", "grailsui-core"
    }

    'grailsui-tooltips' {
        dependsOn "yui-fonts", "yui-utilities", "yui-container", "bubbling-tooltips", "grailsui-core"
    }

    'grailsui-tabview' {
        dependsOn "yui-fonts", "yui-tabview", "grailsui-core"
    }

    'grailsui-dialog' {
        dependsOn "yui-fonts", "yui-container", "yui-button", "grailsui-core"
    }

    'grailsui-autocomplete' {
        dependsOn "yui-fonts", "yui-autocomplete", "grailsui-styles", "grailsui-core"
    }

    'grailsui-rich-editor' {
        dependsOn "yui-fonts", "grailsui-yui-sam", "yui-element", "yui-container", "yui-editor", "grailsui-core"
    }

    'grailsui-expandable-panel' {
        dependsOn "yui-fonts", "grailsui-yui-sam", "yui-container", "yui-utilities", "bubbling-accordion", "grailsui-core"
    }

    'grailsui-accordion' {
        dependsOn "yui-fonts", "yui-container", "yui-utilities", "bubbling-accordion", "grailsui-styles", "grailsui-core"
    }

    'grailsui-data-table' {
        dependsOn "yui-fonts",
                  "yui-utilities",
                  "yui-datatable",
                  "yui-connection",
                  "yui-menu",
                  "grailsui-core",
                  "grailsui-expandable-datatable",
                  "grailsui-styles",
                  "grailsui-loading-dialog"
    }

    'grailsui-dialog' {
        dependsOn "yui-fonts", "yui-button", "grailsui-core"
    }

    'grailsui-draggable-list' {
        dependsOn "yui-fonts", "grailsui-yui-sam", "yui-animation", "yui-dragdrop", "grailsui-core"
        resource url: [plugin: "grails-ui", dir: "js/grailsui", file: "DraggableListItem.js"], disposition: "head"
    }

    /*
    'grailsui-chart' {
        javascriptKeys = ["yahoo-dom-event", "element", "datasource", "json", "connection", "charts", "swf"]
        flashKeys = ["charts"]
    }
    */
}
