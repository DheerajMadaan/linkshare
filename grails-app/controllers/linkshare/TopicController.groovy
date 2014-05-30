package linkshare



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TopicController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    /*static navigation = [
            [group:'tabs', action:'save', title: 'My Timeline', order: 0],
            [action: 'create', title: 'Global Timeline', order: 1]
    ]*/
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def userId=session.userId;
         User user=User.get(userId)
        println "..........."+user

        List<Topic> topicInstanceList= Topic.createCriteria().list(params){
            or {
                eq('visibility','Public')
                eq('user', user)
            }
        };
        render view:'index', model:[topicInstanceCount:topicInstanceList.totalCount,topicInstanceList:topicInstanceList]

            }

    def show(Topic topicInstance) {

        respond topicInstance
    }

    def create() {
        respond new Topic(params)
    }
      def ajax(){
     def fullUrl=params.test;
     println "hi------------------------------"+params
     def tinyUrl=new URL("http://tinyurl.com/api-create.php?url=${fullUrl}").text
     render(contentType:"application/json") {
         urls(small: tinyUrl, full: params.fullUrl)
     }
 }
    @Transactional
    def save(Topic topicInstance) {
        println topicInstance.validate()
        println topicInstance.errors.allErrors
        if (topicInstance == null) {
            notFound()
            return
        }
         if (topicInstance.hasErrors()) {
            respond topicInstance.errors, view:'create'
            return
        }

        topicInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'topic.label', default: 'Topic'), topicInstance.id])
                redirect topicInstance
            }
            '*' { respond topicInstance, [status: CREATED] }
        }
    }

    def edit(Topic topicInstance) {
        respond topicInstance
    }

    @Transactional
    def update(Topic topicInstance) {
        if (topicInstance == null) {
            notFound()
            return
        }

        if (topicInstance.hasErrors()) {
            respond topicInstance.errors, view:'edit'
            return
        }

        topicInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Topic.label', default: 'Topic'), topicInstance.id])
                redirect topicInstance
            }
            '*'{ respond topicInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Topic topicInstance) {

        if (topicInstance == null) {
            notFound()
            return
        }

        topicInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Topic.label', default: 'Topic'), topicInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
