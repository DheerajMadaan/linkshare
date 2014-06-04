package org.codehaus.groovy.grails.plugins.web.taglib;

/**
 * An implementation for the Yahoo! UI Library.
 */
class YuiProvider implements JavascriptProvider {

    def doRemoteFunction(taglib, attrs, out) {
        
        if (attrs.onLoading) {
            out << "${attrs.onLoading};"
        }

        def method = (attrs.method ? attrs.remove('method') : 'POST')
        out << "YAHOO.util.Connect.asyncRequest('${method}'"

        def jsParams = null
        if (attrs.params) {
            jsParams = attrs.params.findAll { it.value instanceof JavascriptValue }
            for (p in jsParams) { attrs.params.remove(p.key) }
        }
                
        // build url
        def url
        if (attrs.url) {
            url = taglib.createLink(attrs.url)
        }
        else {
            url = taglib.createLink(attrs)
        }
        attrs.remove('url')

        // process params
        def paramString = createQueryString(jsParams)

        def i = url?.indexOf('?')
        if (i > -1) {
            def urlParams = new StringBuilder(url[i+1..-1].encodeAsJavaScript())

            if (paramString) {
                if (urlParams && urlParams[-1] != '&') urlParams << '&'
                urlParams << paramString
            }
            paramString = urlParams.toString()

            url = url[0..<i]
        }

        def postData = 'null'
        if (method == "POST") {
            postData = "'${paramString}'"
            url = "'${url}'"
        }
        else if (paramString) {
            url = "'${url}?${paramString}'"
        }
        else {
            url = "'${url}'"
        }

        out << ", ${url}, "
        buildCallback(attrs, out)
        out << ", ${postData});"

        // remove all onX callback events
        def callbacks = attrs.findAll { k, v ->
            k ==~ /on(\p{Upper}|\d){1}\w+/
        }
        callbacks.each { k, v ->
            attrs.remove(k)
        }
        
        attrs.remove('params')
    }

    // helper method to create callback object
    def buildCallback(attrs, out) {     
        
        out << '{'
        
        // success
        out << 'success: function(o){'
        if (attrs.onLoaded) {
            out << "${attrs.onLoaded};"
        }
        if (attrs.update instanceof Map) {
            if (attrs.update?.success) {
                out << "YAHOO.util.Dom.get('${attrs.update.success}').innerHTML = o.responseText;"
            }
        }
        else if (attrs.update) {
            out <<  "YAHOO.util.Dom.get('${attrs.update}').innerHTML = o.responseText;"
        }
        if(attrs.onSuccess) {
            out << "${attrs.onSuccess};"
        }	
        if(attrs.onComplete) {
            out << "${attrs.onComplete};"
        }		  
        out << '}, '
        
        // failure
        out << 'failure: function(o){'									
        if (attrs.update instanceof Map) {
            if (attrs.update?.failure) {
                out << "YAHOO.util.Dom.get('${attrs.update.failure}').innerHTML = o.statusText;"
            }
        }
        if (attrs.onFailure) {
            out << "${attrs.onFailure};"
        }	
        if (attrs.onComplete) {
            out << "${attrs.onComplete};"
        }													
        out << '}'
        
        out << '}'
    }

    private String createQueryString(params) {
        def allParams = []
        for (entry in params) {
            def value = entry.value
            def key = entry.key
            if (value instanceof JavascriptValue) {
                allParams << "${key.encodeAsURL()}='+${value.value}+'"
            }
            else {
                allParams << "${key.encodeAsURL()}=${value.encodeAsURL()}".encodeAsJavaScript()
            }
        }
        if (allParams.size() == 1) {
            return allParams[0]
        }
        else {
            return allParams.join('&')
        }
    }
    
    def prepareAjaxForm(attrs) {
        if (attrs.before) {
            attrs.before += ";YAHOO.util.Connect.setForm('${attrs.name}')"
        }
        else {
            attrs.before = "YAHOO.util.Connect.setForm('${attrs.name}')"
        }
	}
}
