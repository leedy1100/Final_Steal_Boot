package com.steal.bs.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private MainBizImpl userDeSer;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		String id = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();
		
		MainDto dto = (MainDto)userDeSer.loadUserByUsername(id);
		if(!passwordEncoder.matches(password, dto.getMain_password())) {
			System.out.println("비밀번호 오류");
			throw new BadCredentialsException("암호가 일치하지 않습니다.");
		}
		
		if(!dto.isEnabled()) {
			System.out.println("ENABLE 오류!");
            throw new  DisabledException("인증되지 않은 회원입니다.");
        }
		return new UsernamePasswordAuthenticationToken(id,password,dto.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
	
}
