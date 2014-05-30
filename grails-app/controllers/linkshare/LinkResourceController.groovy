package linkshare



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LinkResourceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {

        params.max = Math.min(max ?: 10, 100)
        String userId=session.userId+"";
        List<LinkResource> linkResourceInstance=LinkResource.createCriteria().list(params) {
            topic{
                or {
                    user {
                        eq('userId', userId)
                    }
                    eq('visibility', 'Public')
                }

            }


        }
        render view:'index', model:[linkResourceInstanceList:linkResourceInstance,linkResourceInstanceCount: linkResourceInstance.totalCount]

    }

    def show(LinkResource linkResourceInstance) {
        respond linkResourceInstance
    }

    def create() {
        respond new LinkResource(params)
    }
    def showLinks(){
        String topicId=params.id;

        Topic topic=Topic.get(topicId);
        if(topic){
            List<LinkResource>  linkResourceList=  LinkResource.findAllByTopic(topic);
            render view:"index", model: [linkResourceInstanceList:linkResourceList,topicName:topic.topicName]


        }
    }

    @Transactional
    def save() {
        if(!params.linkURL?.startsWith("http"))
            params.linkURL="http://"+params.linkURL;

        LinkResource linkResourceInstance=new LinkResource(params)


         println linkResourceInstance.errors.allErrors
        if (linkResourceInstance.hasErrors()) {
            respond linkResourceInstance.errors, view:'create'
            return
        }
        println "...................err....."+linkResourceInstance.hasErrors()
        linkResourceInstance.save flush:true


                flash.message = message(code: 'default.created.message', args: [message(code: 'linkResource.label', default: 'LinkResource'), linkResourceInstance.id])
                redirect view:"show", model:linkResourceInstance

    }

    def edit(LinkResource linkResourceInstance) {
        respond linkResourceInstance
    }

    @Transactional
    def update(LinkResource linkResourceInstance) {
        if (linkResourceInstance == null) {
            notFound()
            return
        }

        if (linkResourceInstance.hasErrors()) {
            respond linkResourceInstance.errors, view:'edit'
            return
        }

        linkResourceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LinkResource.label', default: 'LinkResource'), linkResourceInstance.id])
                redirect linkResourceInstance
            }
            '*'{ respond linkResourceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(LinkResource linkResourceInstance) {

        if (linkResourceInstance == null) {
            notFound()
            return
        }

        linkResourceInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'LinkResource.label', default: 'LinkResource'), linkResourceInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'linkResource.label', default: 'LinkResource'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
