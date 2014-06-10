package com.linkshare.enums

/**
 * Created by dheerajmadaan on 8/6/14.
 */
public enum InvitationStatus {
    ACCEPTED('Accepted'),
    REJECTED('Rejected'),
    PENDING('Pending')
    private String invitationStatusCode
    public String getInvitationStatus(){
        return invitationStatusCode

    }
    InvitationStatus(String invitationStatusCode){
        this.invitationStatusCode=invitationStatusCode

    }



}