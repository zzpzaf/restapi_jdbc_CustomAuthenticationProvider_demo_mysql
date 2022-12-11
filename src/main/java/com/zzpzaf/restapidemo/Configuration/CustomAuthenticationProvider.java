package com.zzpzaf.restapidemo.Configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;
import com.zzpzaf.restapidemo.Repositories.UsersRepo;
import com.zzpzaf.restapidemo.dataObjects.User;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {


    @Autowired
    private UsersRepo repo;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {

        String uname = String.valueOf(authentication.getName());
        String upassw = String.valueOf(authentication.getCredentials());
        if ( uname.equals(null) || upassw.equals(null) ) throw new BadCredentialsException("Bad Credentials");
        
        User user = null;           
        user = repo.findByName(uname); 
        if (user == null) {
            throw new BadCredentialsException("Bad Credentials");
        }

        if (repo.isUserPasswordValid(uname, upassw)) {
            return new UsernamePasswordAuthenticationToken(user.getUSERNAME(), null, user.getAuthorities());
        } else {
            throw new BadCredentialsException("Bad Credentials");
        }
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
    
}
