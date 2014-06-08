package com.linkshare.enums

/**
 * Created by dheerajmadaan on 8/6/14.
 */
public enum InvitationStatus {
    ACCEPTED('accepted'),
    REJECTED('rejected'),
    PENDING('pending')
    private int invitationStatusCode
    public String getInvitaionStatus(){
        return invitationStatusCode

    }



}