package linkshare

import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Transactional
class UtilService {

    String uploadFile(CommonsMultipartFile mhsr) {
         String fileName=null;
         try {

             if (!mhsr?.empty) {
                 fileName = mhsr.originalFilename+"-" + new Random().nextInt();
                 mhsr.transferTo(new File("/home/dheerajmadaan/" + fileName))
             }
         }catch (Exception ex)
         {
             log.error("Exception in uploading file"+ex)
         }
        return fileName
    }
}
