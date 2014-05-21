import linkshare.User

class BootStrap {

    def init = { servletContext ->
        User user=new User(userId:"1@1.com",password:"1",confirmPassword:"1", address:"1",emailId:"1@1.com");
        println ".....validate............"+user.validate()
        println "error---------"+user.errors.allErrors
        user.save();
    }
    def destroy = {
    }
}
