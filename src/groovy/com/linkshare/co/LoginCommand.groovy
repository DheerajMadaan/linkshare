package com.linkshare.co

import grails.validation.Validateable
/**
 * Created by dheerajmadaan on 3/6/14.
 */
@Validateable
class LoginCommand {

    String userId
    String password

    static constraints = {
        userId(nullable: false)
        password(nullable: false)
    }
}
