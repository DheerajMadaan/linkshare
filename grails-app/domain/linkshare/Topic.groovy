package linkshare

class Topic {
    String topicName
    String description
    String visibility
    static belongsTo = [user:User]
    static searchable={
        spellCheck "include"
        only=  ["topicName"]
    }

    static hasMany = [resources:Resource,subscription:Subscription]
    static constraints = {
        topicName(nullable: false,unique: true,maxSize: 100)
        description(nullable: false)
    }
}
