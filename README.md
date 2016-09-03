# frequency - Currency converter
A protected currency converter application using a public currency converter API: http://api.fixer.io/latest?base=EUR based and SpringMVC and Hibernate with a MySql database.

Please check the working online app hosted on OpenShift by accessing:
http://frequency-wermvc.rhcloud.com/frequency/login.htm

For a quick test user credentials can be used: superuser/superuser 

For a local worling copy:

1. Clone the project using the GitHub repository URL: 
   https://github.com/diafelea/frequency 
   
2. Modify pom.xml file in order to place the war directly into your tomcat webapps folder, or in the desired folder
   
   <plugin>
		<groupId>org.apache.maven.plugins</groupId>
		<artifactId>maven-war-plugin</artifactId>
		<configuration>
			<outputDirectory>C:\tomcat\apache-tomcat-7.0.56\webapps</outputDirectory> 
		</configuration>
	</plugin>
	
3. Create database frequency and the tables by following the below structure:

	CREATE TABLE `users` (
	  `username` varchar(45) NOT NULL,
	  `password` varchar(45) NOT NULL,
	  `enabled` tinyint(1) NOT NULL DEFAULT '1',
	  `email` varchar(50) DEFAULT NULL,
	  `street` varchar(50) DEFAULT NULL,
	  `city` varchar(50) DEFAULT NULL,
	  `country` varchar(50) DEFAULT NULL,
	  `zipcode` varchar(20) DEFAULT NULL,
	  `dob` date DEFAULT NULL,
	  PRIMARY KEY (`username`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	CREATE TABLE `user_roles` (
	  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
	  `username` varchar(45) NOT NULL,
	  `role` varchar(45) NOT NULL,
	  PRIMARY KEY (`user_role_id`),
	  UNIQUE KEY `uni_username_role` (`role`,`username`),
	  KEY `fk_username_idx` (`username`),
	  CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
	) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

	CREATE TABLE `currencyConverter` (
	  `id` int(11) NOT NULL AUTO_INCREMENT,
	  `fromcurrency` varchar(20) DEFAULT NULL,
	  `tocurrency` varchar(20) DEFAULT NULL,
	  `searchdate` date DEFAULT NULL,
	  `amountoconvert` double DEFAULT NULL,
	  `convertedamount` double DEFAULT NULL,
	  `username` varchar(30) NOT NULL,
	  `date` varchar(30) DEFAULT NULL,
	  PRIMARY KEY (`id`)
	) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

4. Go to: /frequency/src/main/webapp/WEB-INF/resources/properties/database.properties and update with the proper credentials of your own mysql instance if not root/root already...

5. Open command line in the frequency folder containing the pom.xml file and run: mvn clean install 

