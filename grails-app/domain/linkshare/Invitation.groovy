package linkshare

import com.linkshare.enums.InvitationStatus

class Invitation implements Serializable {

    Date invitationDate=new Date();
    User invitedBy
    InvitationStatus invitationStatus
    static belongsTo = [user:User,topic:Topic]

    static constraints = {
    }
    static mapping = {
        id composite: ['user','topic']
        invitationStatus enumType: 'ordinal'
    }
}
