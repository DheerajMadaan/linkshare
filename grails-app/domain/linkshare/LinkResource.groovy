package linkshare

class LinkResource extends Resource{

    String linkURL
    static constraints = {
        linkURL(url: true)
    }
}
