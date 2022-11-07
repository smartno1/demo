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
@PropertySource(value = "classpath:db_info.properties") // ("classpath:db_info.properties") value 는 생략가능
public class DataBaseConfig {

    @Value("${local.db.username}")
    private String userName;
    @Value("${local.db.password}")
    private String password;
    @Value("${local.db.url}")
    private String url;
    @Value("${local.db.driveClassName}")
    private String driveClassName;

    @Bean
    public DataSource dataSource() {

        HikariConfig config = new HikariConfig();
        config.setUsername(userName);
        config.setPassword(password);
        config.setJdbcUrl(url);
        config.setDriverClassName(driveClassName);

        return new HikariDataSource(config);
    }
}
