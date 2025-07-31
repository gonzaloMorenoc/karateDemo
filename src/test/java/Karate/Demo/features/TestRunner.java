package Karate.Demo.features;

import com.intuit.karate.junit5.Karate;

class TestRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("userDetails").relativeTo(getClass());
    }
    
    @Karate.Test
    Karate testPostRequests() {
        return Karate.run("userDetailsPostRequest").relativeTo(getClass());
    }
    
    @Karate.Test
    Karate testDataDriven() {
        return Karate.run("dataDrivenTest").relativeTo(getClass());
    }
    
    @Karate.Test
    Karate testJavaIntegration() {
        return Karate.run("callJavaFile").relativeTo(getClass());
    }
    
    @Karate.Test
    Karate testParallel() {
        return Karate.run("classpath:Karate/Demo/features")
                .tags("~@ignore")
                .parallel(5);
    }
}