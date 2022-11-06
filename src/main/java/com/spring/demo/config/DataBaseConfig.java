package com.spring.demo.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import javax.sql.DataSource;


@Configuration
@ComponentScan(basePackages = "com.spring.demo")
@PropertySource("classpath:db_info.properties")
public class DataBaseConfig {

    @Value("${remote.db.username}")
    private String username;

    @Value("${remote.db.password}")
    private String password;

    @Value("${remote.db.url}")
    private String url;


    @Bean
    public DataSource dataSource() {

        HikariConfig config = new HikariConfig();
        config.setUsername(username);
        config.setPassword(password);
        config.setJdbcUrl(url);
        config.setDriverClassName("org.mariadb.jdbc.Driver");

        return new HikariDataSource(config);
    }
}
