package linkshare

import com.linkshare.enums.InvitationStatus
import grails.transaction.Transactional

@Transactional
class InvitationService {

    def serviceMethod() {

    }
    def saveUserInvitation(List<String> invites,String invitedBy,String topicId){

   /*  def thread=Thread.start {*/
         invites.each {
             userName->
                 Invitation invitation=new Invitation(invitationStatus: InvitationStatus(InvitationStatus.PENDING));

                 println "here--------------"+invitedBy
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
}
