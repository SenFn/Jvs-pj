/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.config;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.provisioning.UserDetailsManager;

/**
 *
 * @author s3n
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
   
	// add a reference to our security data source
	
	@Autowired
	private DataSource securityDataSource;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		// use jdbc authentication ... oh yeah!!!
		
		auth.jdbcAuthentication().dataSource(securityDataSource);
	}
	@Override
	protected void configure(HttpSecurity http) throws Exception {
            
//** matches zero or more 'directories' in a path
        http.authorizeRequests()
        //* matches zero or more characters
       .antMatchers("/resources/css/**").permitAll()
                .antMatchers("/resources/bootstrap/**").permitAll()
                 .antMatchers("/resources/assets/**").permitAll()
                .antMatchers("/resources/jquery/**").permitAll()
                .antMatchers("/resources/fonts/**").permitAll()
                .antMatchers("/resources/images/**").permitAll()
                .antMatchers("/resources/libs/**").permitAll()
                 .antMatchers("/homeadmin*").hasAnyRole("ADMIN")  
                 .antMatchers("/sanpham/saveSanPham*").hasAnyRole( "ADMIN")
                 .antMatchers("/sanpham/list*").hasAnyRole( "ADMIN")
                   .antMatchers("/khachhang/saveSanPham*").hasAnyRole( "ADMIN")
                .antMatchers("/khachhang/list*").hasAnyRole( "ADMIN")
                 .antMatchers("/hoadon/list*").hasAnyRole( "ADMIN")
                .antMatchers("/giaohang/list*").hasAnyRole( "ADMIN")
                .antMatchers("/resources/**").permitAll()
                .antMatchers("/").permitAll()
                .and()
                .formLogin()
                .loginPage("/showMyLoginPage")
                //tra ve page mac dinh
                //defaultSuccessUrl("/homeUser")             
                .loginProcessingUrl("/authenticateTheUser").defaultSuccessUrl("/homeUser")
                .permitAll()
                .and()
                .logout().permitAll().logoutSuccessUrl("/")
                .and()
                .exceptionHandling().accessDeniedPage("/access-denied");

    }
	
	@Bean
	public UserDetailsManager userDetailsManager() {
		
		JdbcUserDetailsManager jdbcUserDetailsManager = new JdbcUserDetailsManager();
		
		jdbcUserDetailsManager.setDataSource(securityDataSource);
		
		return jdbcUserDetailsManager; 
	}
}
