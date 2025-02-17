/*package com.findshow.config;

import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.access.hierarchicalroles.RoleHierarchy;
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.session.HttpSessionEventPublisher;

import com.findshow.model.Users;
import com.findshow.repository.UserRepository;
import com.findshow.service.CustomUserDetailsService;

@Configuration
public class SecurityConfig {

	@Bean
    public UserDetailsService userDetailsService() {
        return new CustomUserDetailsService();
    }
	 @Bean
	    public static PasswordEncoder passwordEncoder(){
	        return new BCryptPasswordEncoder(); 
	        }

	    @Bean
	    public DaoAuthenticationProvider authenticationProvider() {
	        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
	        authProvider.setUserDetailsService(userDetailsService());
	        authProvider.setPasswordEncoder(passwordEncoder());
	         
	        return authProvider;
	    }
	    
	    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	        auth.authenticationProvider(authenticationProvider());
	    }

	    @Bean
	    static RoleHierarchy roleHierarchy() {
	        return RoleHierarchyImpl.withDefaultRolePrefix()
	            .role("SUPERADMIN").implies("ADMIN")
	            .role("ADMIN").implies("USER")
	            .build();
	    }

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
	    http  // Disable CSRF protection if not using it
	        .authorizeHttpRequests((requests) -> requests
	        		.requestMatchers("/**").permitAll()
	        		.requestMatchers("/api/admin/register").hasRole("SUPERADMIN")
	            .requestMatchers("/admin/**").hasRole("ADMIN")  // Allow login
	            .requestMatchers("/superadmin/**").hasRole("SUPERADMIN")
	            .requestMatchers("/user/**").hasRole("USER")
	            .anyRequest().authenticated() // Require authentication for other pages
	        )
//	    .csrf(AbstractHttpConfigurer::disable)
	    .sessionManagement(session -> session
	            .maximumSessions(2)
	        )
	        .formLogin((form) -> form
	        		.defaultSuccessUrl("/",true)  // Define login page for form-based authentication
	        		)
	        .logout((logout) -> logout.logoutSuccessUrl("/").invalidateHttpSession(true));
	    return http.build();
	}
	
}*/
package com.findshow.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.hierarchicalroles.RoleHierarchy;
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.findshow.service.CustomUserDetailsService;

import jakarta.servlet.DispatcherType;
@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public UserDetailsService userDetailsService() {
        return new CustomUserDetailsService();
    }

    @Bean
    public static PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService());
        authProvider.setPasswordEncoder(passwordEncoder());
        return authProvider;
    }

    @Bean
    public static RoleHierarchy roleHierarchy() {
        return RoleHierarchyImpl.withDefaultRolePrefix()
                .role("SUPERADMIN").implies("ADMIN")
                .role("ADMIN").implies("USER")
                .build();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests((requests) -> requests
//            		.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
                .requestMatchers("/api/admin/register").hasRole("SUPERADMIN")
                .requestMatchers("/admin/**").hasRole("ADMIN")
                .requestMatchers("/superadmin/**").hasRole("SUPERADMIN")
                .requestMatchers("/user/**").hasRole("USER")
                .requestMatchers("/login","/register","/**").permitAll()
                .anyRequest().authenticated()
            )
            .formLogin((form) -> form
//            		.loginPage("/login")
            		.loginProcessingUrl("/authenticate")
            		.successHandler(customSuccessHandler())
            		.failureUrl("/login?error=true")
            		.usernameParameter("email") 
            		.passwordParameter("passwordHash")
            		.permitAll()
            		)
            .logout((logout) -> logout
                .logoutUrl("/logout") // Ensure logout URL is correct
                .logoutSuccessUrl("/")  // Redirect after successful logout
                .clearAuthentication(true) // Clear authentication
                .invalidateHttpSession(true) // Invalidate the session
            )
            .sessionManagement(session -> session
                .maximumSessions(2)
                // Optional, to prevent session fixation
            );

        return http.build();
    }

    @Bean
    public AuthenticationSuccessHandler customSuccessHandler() {
        return (request, response, authentication) -> {
            StringBuilder targetUrl = new StringBuilder("/");
            if (authentication.getAuthorities().stream()
                    .anyMatch(grantedAuthority -> grantedAuthority.getAuthority().equals("ROLE_ADMIN"))) {
                targetUrl = new StringBuilder("/admin/dashboard");
            } else if(authentication.getAuthorities().stream()
                    .anyMatch(grantedAuthority -> grantedAuthority.getAuthority().equals("ROLE_SUPERADMIN"))) {
                targetUrl = new StringBuilder("/superadmin/dashboard");
            } else if(authentication.getAuthorities().stream()
                    .anyMatch(grantedAuthority -> grantedAuthority.getAuthority().equals("ROLE_USER"))) {
                targetUrl = new StringBuilder("/user/dashboard");
            }

            response.sendRedirect(targetUrl.toString());
        };
    }
}
