package linkshare
import com.linkshare.co.LoginCommand

class UserController {


    def logout(){
       session.invalidate();
       redirect(action: "login")
    }
    def summary1(LoginCommand loginCommand){


        if(loginCommand.hasErrors()){

             render (view: "login", model:[loginErrors: loginCommand.errors] )
             return
         }

         User validUser=User.findByUserIdAndPassword(params.userId,params.password);
         if(validUser){
            session.userId=validUser.id
            render view:"welcome"
        }  else
        {

             flash.message="UserName/Password do not match."
             render (view: "login", model:[loginErrors: validUser.errors] )
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
