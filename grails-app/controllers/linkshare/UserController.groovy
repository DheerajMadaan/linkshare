package linkshare

class UserController {

    def summary1(){
      User validUser=User.findByUserIdAndPassword(params.userId,params.password);
         if(validUser){
            session.userId=params.userId
            render view:"welcome"
        }  else
        {
             render view:"login"
        }

    }

    def index(){
        redirect(action: "login")
    }
    def login() { }
    def register(){

    }
    def addUser(User user){
     user.properties=params;
     println user.emailId
     println user.validate();
     if(!user.validate()){
         render (view: "register",model: [userInstance:user])
     }
     else {
         user.save();
         render view: "show.gsp" ,model:[user:user]
     }

    }
    def show(User user) {
        respond user
    }

}
