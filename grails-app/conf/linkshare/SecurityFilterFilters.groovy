package linkshare

class SecurityFilterFilters {

    def filters = {
        all(controller:'*', action:'login|register|addUser|summary1',invert:true) {
            before = {
/*
             if(!session.userId){
                 render view: "login"
             }*/
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
