package linkshare

import com.linkshare.enums.InvitationStatus
import grails.transaction.Transactional
import javassist.bytecode.analysis.SubroutineScanner

@Transactional
class InvitationService {

    def serviceMethod() {

    }
    def saveUserInvitation(List<String> invites,String invitedBy,String topicId){

   /*  def thread=Thread.start {*/
         invites.each {
             userName->
                 Invitation invitation=new Invitation();
                 invitation.invitationStatus=InvitationStatus.PENDING;
                 invitation.invitedBy=User.findWhere(userId: invitedBy);
                 User user=User.findWhere(userId: userName);
                 Topic topic=Topic.get(Long.valueOf(topicId));
                 user.addToInvitation(invitation);
                 topic.addToInvitation(invitation);
                 Invitation.withTransaction {
                     invitation.save();
                 }


         }
     //}

    }

    boolean changeInvitationStatus(Long topicId,Long userId,String status){
        boolean flag=false;
        User user=User.get(userId);
        Topic topic=Topic.get(topicId)
        Invitation inv=Invitation.findByUserAndTopic(user,topic);
        inv.invitationStatus=InvitationStatus.valueOf(status);
        inv.save()
        if(inv.invitationStatus==InvitationStatus.ACCEPTED) {
            Subscription sub = new Subscription();
            user.addToSubscription(sub);
            topic.addToSubscription(sub);
            sub.save()
        }
        return flag;


    }
}
