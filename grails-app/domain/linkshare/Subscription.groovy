package linkshare

class Subscription implements  Serializable{

    Date subscriptionDate=new Date();
    User user;
    Topic topic
    static belongsTo = [user:User,topic:Topic]

    static constraints = {
    }

    static mapping = {
        id composite: ['user','topic']
    }
}
