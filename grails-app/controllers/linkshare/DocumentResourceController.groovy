package linkshare

import org.springframework.web.multipart.commons.CommonsMultipartFile

import javax.print.Doc

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DocumentResourceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]
    UtilService utilService
    def index(Integer max) {

        params.max = Math.min(max ?: 10, 100)
        String userId=session.userId+"";
        List<DocumentResource> documentResourceInstance=DocumentResource.createCriteria().list(params) {
            topic{
                or {
                    user {
                        eq('userId', userId)
                    }
                    eq('visibility', 'Public')
                }

            }
login

        }
        render view:'index', model:[documentResourceInstanceList:documentResourceInstance,documentResourceInstanceCount: documentResourceInstance.totalCount]

    }

    def show(DocumentResource documentResourceInstance) {


        respond documentResourceInstance
    }
    def showDocuments(){
        String topicId=params.id;

        Topic topic=Topic.get(topicId);
        if(topic){
            List<DocumentResource>  documentResourceList=  DocumentResource.findAllByTopic(topic);
            render view:"index", model: [documentResourceInstanceList:documentResourceList,topicName:topic.topicName]


        }
    }

    @Transactional
    def save(DocumentResource documentResourceInstance) {

        CommonsMultipartFile mhsr=request.getFile("fileName");


        params.fileType=mhsr.contentType;

            String fileName = utilService.uploadFile(mhsr)
            params.fileName = fileName
            documentResourceInstance.properties = params;

            if (fileName) {
                params.fileName = fileName
                documentResourceInstance.save flush: true

                request.withFormat {
                    form multipartForm {
                        flash.message = message(code: 'default.created.message', args: [message(code: 'documentResource.label', default: 'DocumentResource'), documentResourceInstance.id])
                        redirect documentResourceInstance
                    }
                    '*' { respond documentResourceInstance, [status: CREATED] }
                }
            }else {

                params.topic=params.topic.id
                documentResourceInstance.errors.rejectValue("fileName","resource.file.upload")
                render (view:"create",model: [documentResourceInstance:documentResourceInstance])
            }

    }

    def create() {

        respond new DocumentResource(params)
    }

    def edit(DocumentResource documentResourceInstance) {

        params.topic=documentResourceInstance.topicId
        respond documentResourceInstance
    }

    @Transactional
    def update() {

        DocumentResource documentResourceInstance=DocumentResource.get(params.id)
        if (documentResourceInstance == null) {
            notFound()
            return
        }



        CommonsMultipartFile mhsr=request.getFile("fileName");
        String fileName = utilService.uploadFile(mhsr)


        if (fileName) {
            params.fileName = fileName
            params.fileType = mhsr.contentType;
            documentResourceInstance.properties = params;
        }
        else{
            bindData(documentResourceInstance, params, [exclude: ['fileName']])
        }
        if (documentResourceInstance.hasErrors()) {
                println ".....my----------"+documentResourceInstance.fileName+"...para"+params.fileName
                println("error--------------------------"+documentResourceInstance.errors.allErrors)

                respond documentResourceInstance.errors, view:'edit'
                return
            }
            documentResourceInstance.save flush: true
        println ".....hi----------"+documentResourceInstance.fileName
            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.updated.message', args: [message(code: 'DocumentResource.label', default: 'DocumentResource'), documentResourceInstance.id])
                    redirect documentResourceInstance
                }
                '*' { respond documentResourceInstance, [status: OK] }
            }

    }

    @Transactional
    def delete(DocumentResource documentResourceInstance) {

        if (documentResourceInstance == null) {
            notFound()
            return
        }

        documentResourceInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DocumentResource.label', default: 'DocumentResource'), documentResourceInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'documentResource.label', default: 'DocumentResource'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    def fileDownload(){
         String fileName =params.fileName;
         String fileType=params.fileType;
         String filePath="/home/dheerajmadaan/"+fileName;
            File file = new File(filePath)
                if (file.exists())
                {
                    response.setContentType(fileType) // or or image/JPEG or text/xml or whatever type the file is
                    response.setHeader("Content-disposition", "attachment;filename=\"${fileName}\"")
                    response.outputStream << file.bytes
                }
                else render "Error!" // appropriate error handling

    }
}
