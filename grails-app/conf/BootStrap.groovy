import linkshare.Subscription
import linkshare.Topic
import linkshare.User

class BootStrap {

    def init = { servletContext ->


        if(!User.get(1l)) {
            User user = new User(userId: "1", password: "1", confirmPassword: "1", address: "1", emailId: "1@1.com");
            user.save();
            Topic topic = new Topic(topicName: "User1", description: "This is for User 1", visibility: "Public", user: user)
            topic.save();

            Subscription subscription = new Subscription();
            topic.addToSubscription(subscription);
            user.addToSubscription(subscription);
            subscription.save();

            user = new User(userId: "2", password: "1", confirmPassword: "1", address: "1", emailId: "2@2.com");
            user.save();
        }




    }
    def destroy = {
    }
}
