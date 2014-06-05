package linkshare

import grails.transaction.Transactional

@Transactional
class ResourceUtilService {

    def serviceMethod() {

    }

    String updateReadStatus(Long userId,Long resourceId)
    {
       Resource rs=Resource.get(resourceId);
       String readStatus=null;
       User user=User.get(userId);
       ResourceStatus resourceStatusInstance=ResourceStatus.findByUserAndResource(user,rs);
       if(resourceStatusInstance==null){
           resourceStatusInstance=new ResourceStatus(readStatus: "read");
           user.addToResourceStatus(resourceStatusInstance);
           rs.addToResourceStatus(resourceStatusInstance);
           resourceStatusInstance.save()
           readStatus="read"
       }else{
           readStatus=resourceStatusInstance.readStatus;
           resourceStatusInstance.readStatus="unread".equals(readStatus)?"read":"unread";
           resourceStatusInstance.save();
           readStatus=resourceStatusInstance.readStatus;

       }

    }
}
