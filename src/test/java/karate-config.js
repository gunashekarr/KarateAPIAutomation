function fn() { 
var env = karate.env; // get system property 'karate.env' karate.log('karate.env system property was:', env); 
if (!env) { 
env = 'dev'; 
} 

var config = { 
env: env, 
myVarName: 'hello karate', 
baseUrl: 'https://dummy.restapiexample.com',
goRestBaseUrl: 'https://gorest.co.in',
tokenID: '6b8f1aeb667a022f2433aee5ca89b9a9d641c252127bc61f2cf3a2789d016f60'
}

if (env == 'dev') { 
// customize 
// e.g. config.foo = 'bar'; 
} else if (env == 'e2e') { 
// customize 
} 
return config; 
}