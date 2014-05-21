package linkshare

class User {
    String userId
    String password
    String address
    String emailId
    String confirmPassword
    static  transients =['confirmPassword']
    static hasMany = [topics:Topic]
    static constraints = {
      confirmPassword bindable:true
      userId(unique: true,nullable: false)
      emailId(unique: true,nullable: false)
      password(validator: {
          password,user->

              if(!password?.equals(user.confirmPassword)){
                 return ['user.password.mismatch']
              }
      })
    }
}
