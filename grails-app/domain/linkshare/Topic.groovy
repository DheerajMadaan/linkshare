package linkshare

class Topic {
    String topicName
    String description
    String visibility
    static belongsTo = [user:User]
    static hasMany = [resources:Resource]
    static constraints = {
        topicName(nullable: false,unique: true,maxSize: 100)
        description(nullable: false)
    }
}
