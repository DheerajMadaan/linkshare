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
            redirect action: "index" , controller: "topic"
        }  else
        {

            loginCommand.errors.rejectValue('userId', 'userIdPassword.Mismatch') //
             render (view: "login", model:[loginErrors: loginCommand.errors] )
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
         render view: "confirm.gsp" ,model:[user:user]
     }

    }
    def show(User user) {
        respond user
    }


    def inviteUsers(){
          List<String> userList=User.withCriteria() {
            projections{
                property ("userId");

            }
             // ne("userId",session.userId?.toString());


        }

       render view: "inviteUsers" ,model:["userList":userList]

    }




}
