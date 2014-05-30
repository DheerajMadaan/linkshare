package linkshare

class ResourceController {
    ResourceUtilService resourceUtilService
    def index() {}
    def changeReadStatus(){

        Long userId=Long.valueOf(session.userId)
        Long resourceId= Long.valueOf(params.resourceId)
        String readStatus=resourceUtilService.updateReadStatus(userId,resourceId)
        render readStatus

    }
}
