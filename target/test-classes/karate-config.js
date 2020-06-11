function fn() {
	
	var config = {
		url : 'https://some-host.in/api/users?page=2'
	}
	
	var env = karate.env
	karate.log("Environment variable value is --> ",env)
	
	if(env == 'qa') {
		config.url = 'https://reqres.in/api/users?page=2';
	}
	else if(env == 'dev'){
		config.url = 'https://dev.in/api/users?page=2';
	} 
	else {
		config.url = 'https://reqres.in/api/users?page=2';
	}
	
	return config;
}