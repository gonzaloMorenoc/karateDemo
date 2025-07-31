function fn() {
    const env = karate.env;
    karate.log('Current environment:', env);
    
    const config = {
        baseUrl: 'https://reqres.in/api',
        timeout: 30000,
        retry: { count: 3, interval: 1000 }
    };
    
    if (env === 'dev') {
        config.baseUrl = 'https://dev-api.reqres.in/api';
    } else if (env === 'qa') {
        config.baseUrl = 'https://qa-api.reqres.in/api';
    } else if (env === 'prod') {
        config.baseUrl = 'https://reqres.in/api';
    }
    
    config.commonHeaders = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
    };
    
    karate.configure('connectTimeout', config.timeout);
    karate.configure('readTimeout', config.timeout);
    karate.configure('retry', config.retry);
    
    return config;
}