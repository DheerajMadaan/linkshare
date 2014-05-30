package linkshare

abstract class Resource {
    String title
    String description
    static belongsTo = [topic:Topic]
    static hasMany = [resourceStatus:ResourceStatus]
    static constraints = {
    }
    static mapping = {
        tablePerSubclass(false)
    }
}
