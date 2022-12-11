package com.zzpzaf.restapidemo.dataObjects;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;


public class User {
	private BigDecimal ID;
	private String USERNAME;
	private String PASSWORD;
    private String EMAIL;
    private Boolean ACCOUNT_ENABLED;

    private List<String> userRoles;
    
    public BigDecimal getID() {
        return ID;
    }
    public void setID(BigDecimal iD) {
        ID = iD;
    }
    public String getUSERNAME() {
        return USERNAME;
    }

    public void setUSERNAME(String uSERNAME) {
        USERNAME = uSERNAME;
    }


    public String getPASSWORD() {
        return PASSWORD;
    }

    public void setPASSWORD(String pASSWORD) {
        PASSWORD = pASSWORD;
    }

    public String getEMAIL() {
        return EMAIL;
    }
    public void setEMAIL(String eMAIL) {
        EMAIL = eMAIL;
    }


    public Boolean getACCOUNT_ENABLED() {
        return ACCOUNT_ENABLED;
    }

    public void setACCOUNT_ENABLED(Boolean aCCOUNT_ENABLED) {
        ACCOUNT_ENABLED = aCCOUNT_ENABLED;
    }

    
    
    @Override
    public String toString() {
        return "User [ACCOUNT_ENABLED=" + ACCOUNT_ENABLED + ", EMAIL=" + EMAIL + ", ID=" + ID + ", PASSWORD=" + PASSWORD
                + ", USERNAME=" + USERNAME + "]";
    }
    
    public void grantAuthority(String authority) {
        if ( userRoles == null ) userRoles = new ArrayList<>();
        this.userRoles.add(authority);
    }

    public void grantAuthorities(List<String> roles) {
        this.userRoles = roles;
    }

    public List<GrantedAuthority> getAuthorities(){
        List<GrantedAuthority> authorities = new ArrayList<>();
        this.userRoles.forEach(role -> authorities.add(new SimpleGrantedAuthority(role)));
        return authorities;
    }

    
}
