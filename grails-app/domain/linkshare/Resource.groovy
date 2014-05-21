package linkshare

abstract class Resource {
    String title
    String description
    static belongsTo = [topic:Topic]
    static constraints = {
    }
    static mapping = {
        tablePerSubclass(false)
    }
}
