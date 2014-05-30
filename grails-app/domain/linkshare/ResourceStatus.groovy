package linkshare

class ResourceStatus {
    String readStatus;
    static belongsTo = [user:User,resource:Resource]
    static constraints = {
    }
}
